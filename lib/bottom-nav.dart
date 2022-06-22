
// import 'package:document_saver/screens/details-page/details_page.dart';
// import 'package:document_saver/screens/home-page/home_page.dart';
// import 'package:flutter/material.dart';

// class BottomNav extends StatefulWidget {
//   BottomNav({Key? key}) : super(key: key);

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   var screens = [HomePage(),AddDocPage()];

//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//          backgroundColor: Colors.black,
//           currentIndex: selectedIndex,
//           onTap: ((value) {
//             setState(() {
//               selectedIndex = value;
//             });
//           }),
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.list), label: "Details")
//           ]),
//     );
//   }
// }
