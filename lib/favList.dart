import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicationinfosys/medicationItem.dart';
import 'package:medicationinfosys/notification.dart';

class FavList extends StatefulWidget {
  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  String id;

  navigateToNotification(DocumentSnapshot medications) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotificationPage(
                  medications: medications,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Medication'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection("medications")
                    .where('isFavourite', isEqualTo: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? Firestore.instance.collection("medications").snapshots()
                      : ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data =
                                snapshot.data.documents[index];
                            return InkWell(
                              onTap: () =>
                              navigateToNotification(snapshot.data.documents[index]),
                           child: MedicationItem(
                              documentSnapshot: data,
                              id: data.documentID,
                              isFavourite: data['isFavourite'],
                              imageUrl: data['imageUrl'],
                              medicationName: data['medicationName'],
                              purpose: data['purpose'],
                            ),
                            );
                          });
                },
              ),
            ),
          ],
        ));
  }
}