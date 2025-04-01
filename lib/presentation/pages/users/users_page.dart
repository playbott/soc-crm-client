import 'package:client/presentation/widgets.dart';
import 'package:client/bloc/bloc.dart';
import 'package:client/core/ext/date_time.dart';
import 'package:client/data/entities/user/users_list_request.dart';
import 'package:client/global.dart';
import 'package:client/presentation/pages/users/users_page_command_panel.dart';
import 'package:client/presentation/widgets/controls/page_layout.dart';

import '../../../data/entities/user/user.dart';
import 'user_edit_dialog.dart';

class UsersPage extends ContentLayout {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  TextFieldOptions nameFieldOptions = TextFieldOptions();
  TextFieldOptions usernameFieldOptions = TextFieldOptions();
  TextFieldOptions phoneNumberFieldOptions = TextFieldOptions();
  int roleId = 0;
  int _pageNumber = 0;
  final int _pageSize = 10;
  int _totalCount = 0;
  int pageCount = 1;

  @override
  void initState() {
    usersTableBloc.add(
      UserEventGet(
        filter: UserRequest(roleId: 0, isActive: true, isDeleted: false),
        page: Page(size: _pageSize, number: _pageNumber + 1),
        reloadUI: false,
      ),
    );
    super.initState();
  }

  void searchUsersFunc(int number, [bool reload = false]) {
    usersTableBloc.add(
      UserEventGet(
        filter: UserRequest(
          roleId: roleId,
          name: nameFieldOptions.controller.text,
          userName: usernameFieldOptions.controller.text,
          phoneNumber: phoneNumberFieldOptions.controller.text,
          isActive: true,
          isDeleted: false,
        ),
        page: Page(number: number + 1, size: _pageSize),
        reloadUI: reload,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      constraints: BoxConstraints(maxHeight: 800, maxWidth: 1200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          UsersPageCommandPanel(
            nameFieldOptions: nameFieldOptions,
            usernameFieldOptions: usernameFieldOptions,
            phoneNumberFieldOptions: phoneNumberFieldOptions,
            searchUsersFunc: searchUsersFunc,
            roleId: (value) {
              roleId = value;
              searchUsersFunc(0);
            },
          ),
          BlocBuilder<UserBloc, UserState>(
            bloc: usersTableBloc,
            builder: (context, state) {
              if (state is UserStateCompleted) {
                final data = state.users;
                _totalCount = state.page.totalCount;
                pageCount = (_totalCount / _pageSize).ceil();
                _pageNumber = state.page.number;
                var dataSource = UserListData(
                  context: context,
                  data: data,
                  totalCount: _totalCount,
                  offset: ((_pageNumber - 1) * _pageSize).ceil(),
                  pageSize: _pageSize,
                  actionAfterUpdateUser: () {
                    usersTableBloc.add(
                      UserEventGet(
                        filter: UserRequest(isActive: true, isDeleted: false),
                        page: Page(size: _pageSize, number: _pageNumber),
                        reloadUI: true,
                      ),
                    );
                  },
                );
                return Container(
                  constraints: BoxConstraints(minWidth: 200, maxHeight: 606),
                  child:
                      data.isEmpty
                          ? Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [Text('No users found')],
                                ),
                              ],
                            ),
                          )
                          : MyTableWidget(
                            rowsPerPage: _pageSize,
                            onCellTap: (id) {
                              if ((id is int) && id > 0) {
                                showDialog<String>(
                                  context: context,
                                  builder:
                                      (context) => UserEditDialog(
                                        userId: id,
                                        actionAfterUpdateUser: () {},
                                      ),
                                );
                              }
                            },
                            columns: [
                              MyColumn(
                                name: 'num',
                                title: 'numberLbl'.i18n(),
                                width: 50.0,
                              ),
                              MyColumn(name: 'name', title: 'fullName'.i18n()),
                              MyColumn(
                                name: 'user_name',
                                title: 'userName'.i18n(),
                              ),
                              MyColumn(
                                name: 'phone_number',
                                title: 'phoneNumber'.i18n(),
                              ),
                              MyColumn(name: 'role', title: 'role'.i18n()),
                              MyColumn(
                                name: 'created_at',
                                title: 'createdAt'.i18n(),
                              ),
                            ],
                            source: dataSource,
                            pageCount: pageCount,
                            onPageChanged: (number) {
                              usersTableBloc.add(
                                UserEventGet(
                                  filter: UserRequest(
                                    roleId: roleId,
                                    name: nameFieldOptions.controller.text,
                                    userName:
                                        usernameFieldOptions.controller.text,
                                    phoneNumber:
                                        phoneNumberFieldOptions.controller.text,
                                    isActive: true,
                                    isDeleted: false,
                                  ),
                                  page: Page(
                                    number: number + 1,
                                    size: _pageSize,
                                  ),
                                  reloadUI: false,
                                ),
                              );
                            },
                          ),
                );
              }
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (state is UsersStateLoading)
                          CircularProgressIndicator(),
                        if (state is UsersStateFailed) Text('error'.i18n()),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class UserListData extends BaseTableData<User> {
  UserListData({
    required super.data,
    required super.totalCount,
    required super.offset,
    required super.pageSize,
    required super.context,
    required this.actionAfterUpdateUser,
  });

  final VoidCallback actionAfterUpdateUser;

  @override
  BaseTableRow buildRow(User item) {
    return BaseTableRow(
      id: item.id,
      cells: [
        BaseTableCell(
          columnName: 'num',
          value: (offset + data.indexOf(item) + 1),
        ),
        BaseTableCell(columnName: 'name', value: item.name),
        BaseTableCell(columnName: 'username', value: item.userName),
        BaseTableCell(columnName: 'phone', value: item.phoneNumber),
        BaseTableCell(columnName: 'role', value: item.role.title.en),
        BaseTableCell(
          columnName: 'created_at',
          value: item.createdAt?.formatRuDate ?? '',
        ),
      ],
    );
  }
}
