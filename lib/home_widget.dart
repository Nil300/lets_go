import 'package:flutter/material.dart';
import 'package:lets_go/pages.dart';
import 'package:lets_go/services/auth_service.dart';
import 'package:lets_go/widgets/provider_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    WalletPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Budget App"),
//        centerTitle: true,
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.undo),
//            onPressed: () async {
//              try {
//                AuthService _auth = Provider.of(context).auth;
//                await _auth.signOut();
//                print("Signed Out!");
//              } catch (e) {
//                print(e);
//              }
//            },
//          ),
          FlatButton.icon(
            onPressed: () async {
              try {
                AuthService _auth = Provider.of(context).auth;
                await _auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print(e);
              }
            },
            label: Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.cancel, color: Colors.white),
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.explore),
              title: new Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.monetization_on),
              title: new Text("Wallet"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text("Profile"),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
