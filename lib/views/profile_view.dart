import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lets_go/views/profile_deatils.dart';
import 'package:lets_go/widgets/provider_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
              future: Provider.of(context).auth.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return displayUserInformation(context, snapshot);
                } else {
                  return CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Name : ${user.displayName}",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Email : ${user.email}",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Created : ${DateFormat('dd/MM/yyyy').format(user.metadata.creationTime)}",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        FlatButton.icon(
          onPressed: () async {
            try {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProfileData()),
              );
              print("Signed Out!");
            } catch (e) {
              print(e);
            }
          },
          label: Text(
            'Add More Details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          icon: Icon(Icons.add_circle, color: Colors.blueAccent),
        ),
      ]),
    );
  }
}
