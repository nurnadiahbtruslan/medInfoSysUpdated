import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicationinfosys/operations.dart';
import 'package:medicationinfosys/constant.dart';


class DetailPage extends StatefulWidget {
  final DocumentSnapshot medications;

  DetailPage({this.medications});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.medications.data["medicationName"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                height: 100,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.medications.data["imageUrl"],
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.medications.data["medicationName"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          editMedication(widget.medications.data["isFavourite"],
                              widget.medications.data["id"]);
                        },
                        icon: widget.medications.data["isFavourite"]
                            ? Icon(
                                Icons.favorite,
                                color: Colors.greenAccent,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.greenAccent,
                              ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(widget.medications.data["purpose"],
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}