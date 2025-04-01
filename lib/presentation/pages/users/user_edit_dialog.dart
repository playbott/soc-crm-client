import 'package:client/presentation/widgets.dart';
import 'package:client/bloc/bloc.dart';
import 'package:client/data/entities/app/title_provider.dart';
import 'package:client/data/entities/user/user_update_request.dart';
import 'package:client/data/entities/user/users_list_request.dart';
import 'package:client/global.dart';

class UserEditDialog extends StatefulWidget {
  const UserEditDialog({
    required this.userId,
    required this.actionAfterUpdateUser,
    super.key,
  });

  final int userId;
  final VoidCallback actionAfterUpdateUser;

  @override
  State<UserEditDialog> createState() => _UserEditDialogState();
}

class _UserEditDialogState extends State<UserEditDialog> {
  final TextFieldOptions userNameOptions = TextFieldOptions(
    rules: [VIsRequired(), VMinLength(3), VMaxLength(50)],
  );
  final TextFieldOptions nameOptions = TextFieldOptions(
    rules: [VIsRequired(), VMinLength(3), VMaxLength(255)],
  );
  final TextFieldOptions phoneNumberOptions = TextFieldOptions(
    rules: [VIsRequired(), VIsNumeric(), VMinLength(11), VMaxLength(11)],
  );
  int roleId = 1;
  int fieldsHashcode = 0;

  void loadData() {
    rolesAllBloc.add(
      RoleEventGet(page: Page(number: 1, orderBy: 'id', size: 9999)),
    );
    userByIdBloc.add(
      UserEventGet(
        filter: UserRequest(
          id: widget.userId,
          isActive: true,
          isDeleted: false,
        ),
        page: Page(size: 1),
        reloadUI: true,
      ),
    );
  }

  @override
  void initState() {
    loadData();
    userByIdBloc.stream.listen((UserState userState) {
      if (userState is UserStateCompleted) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: MyLabel(text: 'userDataEdit'.i18n()),
      content: IntrinsicHeight(
        child: Container(
          width: 400,
          height: 400,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: BlocBuilder<UserBloc, UserState>(
              bloc: userByIdBloc,
              builder: (context, state) {
                if (state is UserStateCompleted) {
                  final user = state.users.first;
                  userNameOptions.controller.text = user.userName;
                  nameOptions.controller.text = user.name;
                  phoneNumberOptions.controller.text = user.phoneNumber;
                  roleId = user.role.id;
                  fieldsHashcode =
                      [
                        user.userName,
                        user.name,
                        user.phoneNumber,
                        user.role.id.toString(),
                      ].join().hashCode;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextBox(
                        options: userNameOptions,
                        label: 'userName'.i18n(),
                        hintText: 'userNameEnterLbl'.i18n(),
                        filled: true,
                        onFail: (input, rules, TextValidationRule failedRule) {
                          print(failedRule.error);
                        },
                      ),
                      const SizedBox(height: 20),
                      MyTextBox(
                        options: nameOptions,
                        label: 'fullName'.i18n(),
                        hintText: 'fullNameEnterLbl'.i18n(),
                        filled: true,
                        onFail: (input, rules, TextValidationRule failedRule) {
                          print(failedRule.error);
                        },
                      ),
                      const SizedBox(height: 20),
                      MyTextBox(
                        options: phoneNumberOptions,
                        hintText: 'phoneNumberEnter'.i18n(),
                        label: 'phoneNumber'.i18n(),
                        enabled: false,
                        filled: true,
                        onFail: (input, rules, TextValidationRule failedRule) {
                          print(failedRule.error);
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<RoleBloc, RoleState>(
                        bloc: rolesAllBloc,
                        builder: (context, state) {
                          if (state is RoleStateCompleted) {
                            return MyDropDown<TitleBase>(
                              items: state.roles,
                              initValue: user.role,
                              label: 'role'.i18n(),
                              onChanged: (role) {
                                if (role != null) {
                                  roleId = role.id;
                                }
                              },
                              filled: true,
                              excludeSelected: true,
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  );
                }
                if (state is UsersStateFailed) {
                  return Center(child: Text('error'.i18n()));
                }
                if (state is UsersStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                loadData();
              },
              icon: Icon(Icons.refresh),
            ),
            Expanded(child: SizedBox.shrink()),
            MyButton(
              text: 'save'.i18n(),
              enabled:
                  (fieldsHashcode !=
                      [
                        userNameOptions.controller.text,
                        nameOptions.controller.text,
                        phoneNumberOptions.controller.text,
                        roleId.toString(),
                      ].join().hashCode),
              onPressed: () {
                var allFields = [
                  userNameOptions,
                  nameOptions,
                  phoneNumberOptions,
                ];
                int errors = 0;
                for (var field in allFields) {
                  final isFormValid = field.formKey.currentState;
                  final wd = field.rules
                      .map((e) => e.error)
                      .toList()
                      .join('\n');
                  if (field.formKey.currentState != null &&
                      isFormValid!.validate()) {
                  } else {
                    errors++;
                  }
                }
                if (fieldsHashcode !=
                    [
                      ...allFields.map((e) => e.controller.text),
                      roleId.toString(),
                    ].join().hashCode) {
                }

                userByIdBloc.add(
                  UserEventUpdate(
                    actionAfterUpdateUser: widget.actionAfterUpdateUser,
                    request: UserUpdateRequest(
                      id: widget.userId,
                      name: nameOptions.controller.text,
                      username: userNameOptions.controller.text,
                      phoneNumber: phoneNumberOptions.controller.text,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 10),
            MyButton(
              text: 'cancel'.i18n(),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ],
    );
  }
}
