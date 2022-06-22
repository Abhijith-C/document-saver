import 'package:document_saver/models/doc_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/details.dart';

class DetailsPage extends StatelessWidget {
  DocModel doc;
  DetailsPage({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width * 0.7,
                height: size.width * 0.7,
                child: Image.memory(doc.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                 details("Title",doc.title),
                  details("Category",doc.category),
                  details("Priority",doc.priority),
                   details("Expiring Date",DateFormat('yyyy-MM-dd').format(doc.expiringDate)),
                    details("Description",doc.description),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  
}
