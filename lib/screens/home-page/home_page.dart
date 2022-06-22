import 'package:document_saver/controller/controller.dart';
import 'package:document_saver/models/doc_model.dart';
import 'package:document_saver/screens/addDoc-page/add_doc.dart';
import 'package:document_saver/screens/details-page/details_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  // final Controller _docController = Get.find();

  @override
  Widget build(BuildContext context) {
    // _docController.getDocs();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => AddDocPage()));
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<Controller>(
        builder: (_controller) {
          return (_controller.allDocs.isNotEmpty)
              ? ListView(
                  children: [
                    title("Important"),
                    (_controller.importantDocs.isNotEmpty)
                        ? customGrid(size, context, _controller.importantDocs)
                        : SizedBox(),
                    title("Normal"),
                    (_controller.normalDocs.isNotEmpty)
                        ? customGrid(size, context, _controller.normalDocs)
                        : SizedBox(),
                  ],
                )
              : Center(
                  child: Text("No Documents Found"),
                );
        },
      ),
    );
  }

  Padding title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding customGrid(Size size, BuildContext context, List<DocModel> docs) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: docs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 0.8),
          itemBuilder: (ctx, index) => GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => DetailsPage(doc: docs[index],)));
              },
              child: documentCard(size, docs[index]))),
    );
  }

  Container documentCard(Size size, DocModel doc) {
    return Container(
      width: size.width * 0.4,
      height: size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: MemoryImage(doc.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(6),
            // color: Colors.grey,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              color: Colors.grey,
            ),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  doc.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  DateFormat('yyyy-MM-dd').format(doc.expiringDate).toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )),
    );
  }
}
