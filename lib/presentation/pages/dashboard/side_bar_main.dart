import 'package:client/bloc/bloc.dart';
import 'package:client/global.dart';
import 'package:client/presentation/widgets.dart';

import 'sidebar_theme.dart';

class SideBarMain extends SideBarLayout {
  const SideBarMain({
    super.key,
    required this.pageIndex,
    required this.onElementTap,
  });

  final int pageIndex;
  final Function(BuildContext, int) onElementTap;

  @override
  Widget build(BuildContext context) {
    final bgColor =
        context.isDarkMode()
            ? Color.fromRGBO(37, 51, 51, 1.0)
            : Color.fromRGBO(45, 65, 61, 1.0);
    return SidebarTheme(
      child: Container(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Scrollbar(
                interactive: true,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: Material(
                  color: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  child: CustomScrollView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    slivers: [
                      //TODO:
                      if (false)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 20.0,
                              bottom: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.account_box_rounded,
                                  size: FS.p1 * 2,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyLabel(
                                      text: 'Rovsh Gurbanov',
                                      fontWeight: FontWeight.w600,
                                      size: FS.p5,
                                      color: Colors.white,
                                    ),
                                    MyLabel(
                                      text: 'rovshik',
                                      fontStyle: FontStyle.italic,
                                      size: FS.p6,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                     if (false) SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MyLabel(
                                text: 'navigation'.i18n().toUpperCase(),
                                color: Colors.white.withAlpha(200),
                                size: FS.p7 - 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ListTile(
                            leading: const Icon(Icons.home_filled),
                            tileColor: pageIndex == 0 ? Colors.black26 : null,
                            title: Text('main'.i18n()),
                            onTap: () {
                              onElementTap(context, 0);
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 20),
                          leading: const Icon(Icons.supervisor_account_rounded),
                          tileColor: pageIndex == 1 ? Colors.black26 : null,
                          title: Text('users'.i18n()),
                          onTap: () {
                            onElementTap(context, 1);
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 20),
                          leading: const Icon(Icons.lock_person_rounded),
                          tileColor: pageIndex == 2 ? Colors.black26 : null,
                          title: Text('rolesPermissions'.i18n()),
                          onTap: () {
                            onElementTap(
                              context,
                              2,
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 20),
                          leading: const Icon(Icons.menu_book_rounded),
                          title: Text('sessions'.i18n()),
                          tileColor: pageIndex == 3 ? Colors.black26 : null,
                          onTap: () {
                            onElementTap(
                              context,
                              3,
                            );
                          },
                        ),
                      ),
                     if (false) SliverToBoxAdapter(
                        child: ExpansionTile(
                          title: Text('usersManagement'.i18n()),
                          leading: const Icon(Icons.manage_accounts),
                          children: [
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: MyLabel(text: 'signOut'.i18n()),
                    onTap: () async {
                      await showDialog<String>(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text(LocaleKeys.logout.i18n()),
                              content: Text(LocaleKeys.signOutWarning.i18n()),
                              actions: [
                                MyButton(
                                  text: 'signOut'.i18n(),
                                  onPressed: () {
                                    authBloc.add(AuthEventSignOut(reload: true));
                                  },
                                ),
                                MyButton(
                                  text: 'no'.i18n(),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
