import 'package:client/bloc/bloc.dart';
import 'package:client/data/entities/app/title_provider.dart';
import 'package:client/data/entities/role/role.dart';
import 'package:client/global.dart';
import 'package:client/presentation/widgets.dart';

class UsersPageCommandPanel extends StatefulWidget {
  const UsersPageCommandPanel({
    super.key,
    required this.nameFieldOptions,
    required this.usernameFieldOptions,
    required this.phoneNumberFieldOptions,
    required this.searchUsersFunc,
    required this.roleId,
  });

  final TextFieldOptions nameFieldOptions;
  final TextFieldOptions usernameFieldOptions;
  final TextFieldOptions phoneNumberFieldOptions;
  final Function(int, bool) searchUsersFunc;
  final ValueChanged<int> roleId;

  @override
  State<UsersPageCommandPanel> createState() => _UsersPageCommandPanelState();
}

class _UsersPageCommandPanelState extends State<UsersPageCommandPanel> {
  int selectedRoleId = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          BlocBuilder<UserBloc, UserState>(
            bloc: usersTableBloc,
            builder: (context, usersState) {
              return Row(
                children: [
                  CommandButton(
                    text: 'add'.i18n(),
                    prefixIcon: Icons.person_add,
                    onPressed: () {},
                  ),
                  CommandButton(
                    text: 'refresh'.i18n(),
                    prefixIcon: Icons.refresh,
                    onPressed: () async {
                      if (usersState is UserStateCompleted) {
                        widget.searchUsersFunc(
                          (usersState.page.number - 1) < 0
                              ? 0
                              : usersState.page.number - 1,
                          true,
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
          Expanded(child: SizedBox()),
          Container(
            width: 230,
            margin: const EdgeInsets.only(right: 5),
            child: BlocBuilder<RoleBloc, RoleState>(
              bloc:
                  rolesAllBloc..add(
                    RoleEventGet(
                      page: Page(number: 1, orderBy: 'id', size: 9999),
                    ),
                  ),
              builder: (context, state) {
                if (state is RoleStateCompleted) {
                  final allItems = [
                    Role(
                      id: 0,
                      title: titleAll(suffix: 'role'.i18n().toLowerCase()),
                      firstElement: true,
                    ),
                    ...state.roles,
                  ];

                  return MyDropDown<TitleBase>(
                    items: allItems,
                    initValue: allItems.first,
                    initCallback: () {},
                    onChanged: (role) {
                      if (role != null) {
                        setState(() {
                          selectedRoleId = role.id;
                          widget.roleId(role.id);
                        });
                      }
                    },
                    onClear:
                        selectedRoleId == 0
                            ? null
                            : () {
                              selectedRoleId = 0;
                              widget.roleId(0);
                            },
                    excludeSelected: true,
                  );
                }
                return Container();
              },
            ),
          ),
          MyTextBox(
            options: widget.nameFieldOptions,
            hintText: 'fullName'.i18n(),
            onSubmitted: (_) {
              widget.searchUsersFunc(0, true);
            },
            width: 200,
            horizontalMargin: 5,
          ),
          MyTextBox(
            options: widget.usernameFieldOptions,
            hintText: 'userName'.i18n(),
            onSubmitted: (_) {
              widget.searchUsersFunc(0, true);
            },
            width: 170,
            horizontalMargin: 5,
          ),
          MyTextBox(
            options: widget.phoneNumberFieldOptions,
            hintText: 'phoneNumber'.i18n(),
            onSubmitted: (_) {
              widget.searchUsersFunc(0, true);
            },
            width: 150,
            horizontalMargin: 5,
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}

class TxtItem extends StatelessWidget {
  const TxtItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
