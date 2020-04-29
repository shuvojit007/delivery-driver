import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../controllers/profile_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../repository/settings_repository.dart';
import '../repository/user_repository.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends StateMVC<DrawerWidget> {
  ProfileController _con;

  _DrawerWidgetState() : super(ProfileController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _con.user.apiToken == null
          ? CircularLoadingWidget(height: 500)
          : ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Pages', arguments: 1);
                  },
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
//              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
                    ),
                    accountName: Text(
                      _con.user.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    accountEmail: Text(
                      _con.user.email,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: NetworkImage(_con.user.image.thumb),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Pages', arguments: 1);
                  },
                  leading: Icon(
                    Icons.fastfood,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).orders,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Notifications');
                  },
                  leading: Icon(
                    Icons.notifications,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).notifications,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Pages', arguments: 2);
                  },
                  leading: Icon(
                    Icons.history,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).history,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    S.of(context).application_preferences,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Help');
                  },
                  leading: Icon(
                    Icons.help,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).help__support,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Settings');
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).settings,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Languages');
                  },
                  leading: Icon(
                    Icons.translate,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).languages,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    if (Theme.of(context).brightness == Brightness.dark) {
                      setBrightness(Brightness.light);
                      DynamicTheme.of(context).setBrightness(Brightness.light);
                    } else {
                      setBrightness(Brightness.dark);
                      DynamicTheme.of(context).setBrightness(Brightness.dark);
                    }
                  },
                  leading: Icon(
                    Icons.brightness_6,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    Theme.of(context).brightness == Brightness.dark
                        ? S.of(context).light_mode
                        : S.of(context).dark_mode,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    logout().then((value) {
                      Navigator.of(context).pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);
                    });
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).log_out,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    S.of(context).version + " 1.4.1",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
    );
  }
}
