import 'package:cloud_firestore/cloud_firestore.dart';

class Repository{

final FirebaseFirestore _db = FirebaseFirestore.instance;
//final databaseReference = FirebaseFirestore.instance;

  final String path;

  CollectionReference ref;

  Repository( this.path ) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get() ;
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  
/*
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }


  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }



  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }*/

}