import 'package:document_saver/models/doc_model.dart';
import 'package:flutter/material.dart';

Padding details(String title, String value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Wrap(
      spacing: 5,
      children: [Text("$title : "), Text(value)],
    ),
  );
}
