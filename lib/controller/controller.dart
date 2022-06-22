import 'dart:typed_data';

import 'package:document_saver/database/database.dart';
import 'package:document_saver/models/doc_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Controller extends GetxController {
  String priority = "Normal";
  Uint8List? image;
  DateTime? date;
  String categoty = "Select Category";
  List<DocModel> importantDocs = [];
  List<DocModel> normalDocs = [];
  List<DocModel> allDocs = [];

  changePriority(String value) {
    priority = value;
    update();
  }

  changeImage(Uint8List img) {
    image = img;
    update();
  }

  changeDate(DateTime value) {
    date = value;
    update();
  }

  changeCategory(String value) {
    categoty = value;
    update();
  }

  addDocument(DocModel data) async {
    final dB = await Hive.openBox<DocModel>('database');
    int id = await dB.add(data);
    data.id = id;
    dB.put(id, data);
    getDocs();
  }

  getDocs() async {
    allDocs.clear();
    importantDocs.clear();
    normalDocs.clear();
    final docs = await Hive.openBox<DocModel>('database');
    if (docs.isNotEmpty) {
      allDocs.addAll(docs.values);
      for (var element in docs.values) {
        if (element.priority == "Important") {
          importantDocs.add(element);
        } else {
          normalDocs.add(element);
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDocs();
  }
}
