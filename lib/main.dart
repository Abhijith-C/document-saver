import 'package:document_saver/controller/controller.dart';
import 'package:document_saver/screens/home-page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/doc_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DocModelAdapter().typeId)) {
    Hive.registerAdapter(DocModelAdapter());
  }
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     Get.put(Controller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
