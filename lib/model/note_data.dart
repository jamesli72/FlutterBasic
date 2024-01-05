import 'package:cloud_firestore/cloud_firestore.dart';

class NoteCloud {
  final CollectionReference configData =
      FirebaseFirestore.instance.collection('note');
  // Create a new document
  Future<void> createData(String title, String content) {
    return configData.add(
        {'title': title, 'content': content, 'timestamp': Timestamp.now()});
  }

  // Read a document
  Stream<QuerySnapshot> readData() {
    final configStream =
        configData.orderBy('timestamp', descending: true).snapshots();
    return configStream;
  }

  // Update a document
  Future<void> updateData(String docId, String title, String content) {
    return configData.doc(docId).update(
        {'title': title, 'content': content, 'timestamp': Timestamp.now()});
  }

  // Delete a document
  Future<void> deleteData(String docId) {
    return configData.doc(docId).delete();
  }
}
