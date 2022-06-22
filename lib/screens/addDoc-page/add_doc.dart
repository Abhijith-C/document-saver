import 'package:document_saver/controller/controller.dart';

import 'package:document_saver/models/doc_model.dart';
import 'package:document_saver/screens/home-page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddDocPage extends StatelessWidget {
  AddDocPage({Key? key}) : super(key: key);
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<String> items = ['Home', 'Office', 'Vehicle'];
  DateTime selectedDate = DateTime.now();
  final Controller _controller = Get.find();
  // Uint8List? image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Details Page"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputField('Enter the Title', _titleController),
              inputField('Enter the Description', _descriptionController),
              GetBuilder<Controller>(builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: categorySelection(items, controller.categoty),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            width: size.width * 0.3,
                            height: size.width * 0.3,
                            child: (controller.image == null)
                                ? Image.asset('assets/images/file.png')
                                : Image.memory(_controller.image!),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                                onPressed: () async {
                                  XFile? image = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);

                                  if (image != null) {
                                    var img = await image.readAsBytes();
                                    // image = File(img.path);
                                    controller.changeImage(img);
                                  }
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: Colors.greenAccent,
                                )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        (controller.date == null)
                            ? const Text("Select expiring date",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                            : Text(
                                DateFormat('yyyy-MM-dd').format(selectedDate),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                            onPressed: () async {
                              selectedDate = (await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2025)))!;
                              controller.changeDate(selectedDate);
                            },
                            icon: const Icon(
                              Icons.date_range,
                              color: Colors.greenAccent,
                              size: 30,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Select Priority',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    radioButton("Normal"),
                    radioButton(
                      "Important",
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  if (_descriptionController.text.isNotEmpty &&
                      _titleController.text.isNotEmpty &&
                      _controller.categoty != "Select Category" &&
                      _controller.image != null &&
                      _controller.date != null) {
                    final data = DocModel(
                        image: _controller.image!,
                        title: _titleController.text.trim(),
                        description: _descriptionController.text.trim(),
                        category: _controller.categoty,
                        expiringDate: _controller.date!,
                        priority: _controller.priority);
                    await _controller.addDocument(data);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (ctx) => HomePage()),
                        (route) => false);
                  } else {
                    Get.snackbar('', "Please fill the requirements");
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      border: Border.all(color: Colors.greenAccent),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: const Center(
                      child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  RadioListTile<String> radioButton(String title) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: _controller.priority,
      onChanged: (value) {
        _controller.changePriority(value as String);
      },
    );
  }

  DropdownButtonHideUnderline categorySelection(
      List<String> items, String title) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          hint: Text(title, style: TextStyle(color: Colors.white)),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            _controller.changeCategory(value as String);
          }),
    );
  }

  Padding inputField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.greenAccent,
              // width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
