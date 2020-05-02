import 'package:flutter/material.dart';
import 'package:lets_go/home_widget.dart';
import 'package:lets_go/models/Trip.dart';
//import 'package:lets_go/views/profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_go/widgets/provider_widget.dart';

class ProfilePageView extends StatefulWidget {
  final Trip trip;

  ProfilePageView({Key key, @required this.trip}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = new TextEditingController();
    TextEditingController _surnameController = new TextEditingController();
    TextEditingController _birthDateController = new TextEditingController();
    TextEditingController _cityController = new TextEditingController();
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _pinCodeController = new TextEditingController();
    TextEditingController _countryController = new TextEditingController();

    _nameController.text = widget.trip.name;
    _surnameController.text = widget.trip.surname;
    _birthDateController.text = widget.trip.dateOfBirth;
    _cityController.text = widget.trip.city;
    _emailController.text = widget.trip.email;
    _emailController.text = widget.trip.pinCode;
    _emailController.text = widget.trip.country;

    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 250.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 0.0, top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
//                            IconButton(
//                              padding: EdgeInsets.only(bottom: 22.0),
//                              iconSize: 20.0,
//                              icon: Icon(Icons.arrow_back_ios),
//                              color: Colors.black,
//                              onPressed: () {
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => ProfileView()),
//                                );
//                              },
//                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Text('PROFILE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.black)),
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
                                    image:
                                        ExactAssetImage('assets/images/as.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
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
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Parsonal Information',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter Your Name",
                                  ),
                                  controller: _nameController,
                                  autofocus: true,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Surname',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter Your Surname",
                                  ),
                                  controller: _surnameController,
                                  autofocus: true,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Birth Date',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  keyboardType: TextInputType.datetime,
                                  decoration: const InputDecoration(
                                    hintText: "DD/MM/YYYY",
                                  ),
                                  controller: _birthDateController,
                                  autofocus: true,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Email ID',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Email ID"),
                                  controller: _emailController,
                                  autofocus: true,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'City',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  controller: _cityController,
                                  decoration: const InputDecoration(
                                      hintText: "Your City"),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Pin Code',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Country',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: TextField(
                                    controller: _pinCodeController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: "Enter Pin Code"),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: TextField(
                                  controller: _countryController,
                                  decoration: const InputDecoration(
                                      hintText: "Your Coutry"),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: Container(
                                  child: SizedBox(
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 15.0),
                                      child: Text(
                                        "Save Data",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19.0,
                                        ),
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.green,
                                      onPressed: () async {
                                        widget.trip.name = _nameController.text;
                                        widget.trip.surname =
                                            _surnameController.text;
                                        widget.trip.dateOfBirth =
                                            _birthDateController.text;
                                        widget.trip.email =
                                            _emailController.text;
                                        widget.trip.city = _cityController.text;
                                        widget.trip.pinCode =
                                            _pinCodeController.text;
                                        widget.trip.country =
                                            _countryController.text;

                                        final uid = await Provider.of(context)
                                            .auth
                                            .getCurrentUID();

                                        await db
                                            .collection('userData')
                                            .document(uid)
                                            .collection('trips')
                                            .add(widget.trip.toJson());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()),
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                    ),
                                  ),
                                ),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Container(
                                    child: RaisedButton(
                                  child: Text("Update Data"),
                                  textColor: Colors.white,
                                  color: Colors.blueAccent,
                                  onPressed: () async {
                                    widget.trip.name = _nameController.text;
                                    widget.trip.surname =
                                        _surnameController.text;
                                    widget.trip.dateOfBirth =
                                        _birthDateController.text;
                                    widget.trip.email = _emailController.text;
                                    widget.trip.city = _cityController.text;
                                    widget.trip.pinCode =
                                        _pinCodeController.text;
                                    widget.trip.country =
                                        _countryController.text;
                                    print('this is Document ID ');
                                    print(widget.trip.documentId);
                                    await updateData(context);
                                    Navigator.of(context).pop();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                )),
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Future updateData(context) async {
    var uid = await Provider.of(context).auth.getCurrentUID();

    final doc = Firestore.instance
        .collection('userData')
        .document(uid)
        .collection("trips")
        .document(widget.trip.documentId);

    return await doc.setData(widget.trip.toJson());
  }
}
