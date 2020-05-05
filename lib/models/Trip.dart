import 'package:cloud_firestore/cloud_firestore.dart';

class Trip {
  String name;
  String surname;
  String dateOfBirth;
  String city;
  String email;
  String pinCode;
  String country;
  String documentId;

  Trip(this.name, this.surname, this.dateOfBirth, this.city, this.email,
      this.pinCode, this.country, this.documentId);

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'dateOfBirth': dateOfBirth,
        'city': city,
        'email': email,
        'pinCode': pinCode,
        'country': country,
      };

  // creating a Trip object from a firebase snapshot
  Trip.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        surname = snapshot['surname'],
        dateOfBirth = snapshot['dateOfBirth'],
        city = snapshot['city'],
        email = snapshot['email'],
        pinCode = snapshot['pinCode'],
        country = snapshot['country'],
        documentId = snapshot.documentID;
}
