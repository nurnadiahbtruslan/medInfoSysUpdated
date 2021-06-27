import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(String _medicationName,
    String _imageUrl, bool _isFavourite, String _purpose, String _unit, String _desc) async {
  await Firestore.instance.collection("medications").add({
    'medicationName': _medicationName,
    'imageUrl': _imageUrl,
    'isFavourite': _isFavourite,
    'purpose': _purpose,
    'unit': _unit,
    'desc': _desc,
  });
}

Future<void> editMedication(bool _isFavourite,String id) async {
  await Firestore.instance
      .collection("medications")
      .document(id)
      .updateData({"isFavourite": !_isFavourite});
}

Future<void> deleteMedication(DocumentSnapshot doc) async {
  await Firestore.instance
      .collection("medications")
      .document(doc.documentID)
      .delete();
}
