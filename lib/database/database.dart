// import 'package:document_saver/controller/controller.dart';
// import 'package:document_saver/models/doc_model.dart';
// import 'package:hive_flutter/adapters.dart';

// addDocument(DocModel data) async {
//   final dB = await Hive.openBox<DocModel>('database');
//   int id = await dB.add(data);
//   data.id = id;
//   dB.put(id, data);
//   Controller().getDocs();
// }

// addDocument(DocModel data) async {
//   final dB = await Hive.openBox<DocModel>('database');
//   int id = await dB.add(data);
//   data.id = id;
//   dB.put(id, data);
//   Controller().getDocs();
// }

// Future<List<DocModel>> getDocuments() async {
//   List<DocModel> docs = [];
//   final dB = await Hive.openBox<DocModel>('database');
//   for (var element in dB.values) {
//     docs.add(element);
//   }
//   return docs;
// }
