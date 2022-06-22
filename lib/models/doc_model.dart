import 'dart:io';
import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';
part 'doc_model.g.dart';

@HiveType(typeId: 1)
class DocModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  Uint8List image;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  String category;

  @HiveField(5)
  DateTime expiringDate;

  @HiveField(6)
  String priority;

  DocModel({
    this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.category,
    required this.expiringDate,
    required this.priority,
  });
}
