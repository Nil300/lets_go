import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_go/views/profile_deatils.dart';
import 'package:lets_go/widgets/provider_widget.dart';
import 'package:lets_go/models/Trip.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name;
  String surname;
  String phoneNumber;
  String email;
  String city;
  String country;
  String pinCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: StreamBuilder(
            stream: getUsersProfileStreamSnapshots(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return CircularProgressIndicator(
                  strokeWidth: 2.0,
                );
              else
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) =>
                        displayUserInformation(
                            context, snapshot.data.documents[index]));
            }),
      ),
    );
  }

  Stream<QuerySnapshot> getUsersProfileStreamSnapshots(
      BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance
        .collection('userData')
        .document(uid)
        .collection('profileData')
        .snapshots();
  }

  Widget displayUserInformation(
      BuildContext context, DocumentSnapshot document) {
//    final user = snapshot.data;
    final trip = Trip.fromSnapshot(document);

    return Column(
      children: <Widget>[
        Container(
          height: 250.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        padding: EdgeInsets.only(
                            bottom: 2.0, right: 120.0, left: 15.0),
                        iconSize: 20.0,
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, top: 12.0),
                        child: Text('PROFILE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/images/as.png'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
        Container(
          color: Color(0xffFFFFFF),
          child: Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Profile Information',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 20.0,
                                  child: IconButton(
                                      padding: EdgeInsets.only(right: 1.0),
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                      onPressed: () {
                                        addDialog(context, document);
                                      })),
                            ),
                          ],
                        )
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Name :  ' + trip.name,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Surname :  ' + trip.surname,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Date Of Birth : ' + trip.dateOfBirth,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Email ID : ' + trip.email,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              'City : ' + trip.city,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'Pin Code : ' + trip.pinCode,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          flex: 2,
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Country : ' + trip.country,
//                                  trip.country,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<bool> addDialog(
      BuildContext context, DocumentSnapshot document) async {
    final trip = Trip.fromSnapshot(document);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Data', style: TextStyle(fontSize: 15.0)),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Name'),
                    onChanged: (value) {
                      this.name = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Surname'),
                    onChanged: (value) {
                      this.surname = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Phone Number'),
                    onChanged: (value) {
                      this.phoneNumber = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Emial'),
                    onChanged: (value) {
                      this.email = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter City'),
                    onChanged: (value) {
                      this.city = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter PinCode'),
                    onChanged: (value) {
                      this.pinCode = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Country'),
                    onChanged: (value) {
                      this.country = value;
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () async {
                  trip.name = this.name;
                  trip.surname = this.surname;
                  trip.dateOfBirth = this.phoneNumber;
                  trip.email = this.email;
                  trip.city = this.city;
                  trip.pinCode = this.pinCode;
                  trip.country = this.country;

                  Navigator.of(context).pop();
                  var uid = await Provider.of(context).auth.getCurrentUID();
                  Firestore.instance
                      .collection('userData')
                      .document(uid)
                      .collection("profileData")
                      .document(trip.documentId)
                      .setData({
                    'name': name,
                    'surname': surname,
                    'phoneNumber': phoneNumber,
                    'city': city,
                    'email': email,
                    'pinCode': pinCode,
                    'country': country,
                  });
                },
              )
            ],
          );
        });
  }

  Future updateData(BuildContext context, DocumentSnapshot document) async {
    final trip = Trip.fromSnapshot(document);
    var uid = await Provider.of(context).auth.getCurrentUID();

    final doc = Firestore.instance
        .collection('userData')
        .document(uid)
        .collection("profileData")
        .document(trip.documentId);

    return await doc.setData(trip.toJson());
  }
}
