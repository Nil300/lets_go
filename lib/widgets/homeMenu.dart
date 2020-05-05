import 'package:flutter/material.dart';
import 'package:lets_go/intro/intro_page.dart';
import 'package:lets_go/models/Trip.dart';
import 'package:lets_go/services/auth_service.dart';
import 'package:lets_go/views/profile_deatils.dart';
import 'package:lets_go/views/profile_view.dart';
import 'package:lets_go/views/wlecome.dart';
import 'package:lets_go/widgets/provider_widget.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  final newTrip = new Trip(null, null, null, null, null, null, null, null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("randon"),
          accountEmail: Text("randon@example.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.input),
          title: Text('Welcome'),
          onTap: () => {
            {
              Navigator.of(context).pop(),
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Intro()))
            },
          },
        ),
//        ListTile(
//          leading: Icon(Icons.account_circle),
//          title: Text('Profile'),
//          onTap: () => {
//            Navigator.of(context).pop(),
//            Navigator.of(context).push(new MaterialPageRoute(
//                builder: (BuildContext context) => new Welcome()))
//          },
//        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () => {
            Navigator.of(context).pop(),
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new ProfilePageView(trip: newTrip)))
          },
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Feedback'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
            title: Text('Logout'),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () async {
                try {
                  AuthService _auth = Provider.of(context).auth;
                  await _auth.signOut();
                  print("Signed Out!");
                } catch (e) {
                  print(e);
                }
              },
            )),
      ],
    );
  }
}
