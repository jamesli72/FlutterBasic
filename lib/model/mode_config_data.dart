import 'package:cloud_firestore/cloud_firestore.dart';

class ModeConfigCloud {
  final CollectionReference configData =
      FirebaseFirestore.instance.collection('config');
  // Create a new document
  Future<void> createData(String temp, String humid, String pH, String frame) {
    return configData.add({
      'temp': temp,
      'humid': humid,
      'pH': pH,
      'frame': frame,
      'timestamp': Timestamp.now()
    });
  }

  // Read a document
  Stream<QuerySnapshot> readData() {
    final configStream =
        configData.orderBy('timestamp', descending: true).snapshots();
    return configStream;
  }

  // Update a document
  Future<void> updateData(
      String docId, String temp, String humid, String pH, String frame) {
    return configData.doc(docId).update({
      'temp': temp,
      'humid': humid,
      'pH': pH,
      'frame': frame,
      'timestamp': Timestamp.now()
    });
  }

  // Delete a document
  Future<void> deleteData(String docId) {
    return configData.doc(docId).delete();
  }
}
