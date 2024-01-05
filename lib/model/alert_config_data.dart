import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigAlertCloud {
  final CollectionReference configData =
      FirebaseFirestore.instance.collection('alert');
  // Create a new document
  Future<void> createData(
    String maxTemp,
    String minTemp,
    String maxHumid,
    String minHumid,
    String maxpH,
    String minpH,
    String maxFrame,
  ) {
    return configData.add({
      'maxtemp': maxTemp,
      'mintemp': minTemp,
      'maxhumid': maxHumid,
      'minhumid': minHumid,
      'maxph': maxpH,
      'minph': minpH,
      'maxframe': maxFrame,
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
    String docId,
    String maxTemp,
    String minTemp,
    String maxHumid,
    String minHumid,
    String maxpH,
    String minpH,
    String maxFrame,
  ) {
    return configData.doc(docId).update({
      'maxtemp': maxTemp,
      'mintemp': minTemp,
      'maxhumid': maxHumid,
      'minhumid': minHumid,
      'maxpH': maxpH,
      'minpH': minpH,
      'frame': maxFrame,
      'timestamp': Timestamp.now()
    });
  }

  // Delete a document
  Future<void> deleteData(String docId) {
    return configData.doc(docId).delete();
  }
}
