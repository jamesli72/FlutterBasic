import 'package:cloud_firestore/cloud_firestore.dart';

class ReportCloud {
  final CollectionReference configData =
      FirebaseFirestore.instance.collection('report');

  Stream<QuerySnapshot> readData() {
    final configStream =
        configData.orderBy('timestamp', descending: true).snapshots();
    return configStream;
  }
}
