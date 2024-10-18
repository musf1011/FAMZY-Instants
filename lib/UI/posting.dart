// import 'dart:io';

// import 'package:detail_information/UI/postingScreen.dart';
// import 'package:detail_information/UI/signUp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';

// class Posting extends StatefulWidget {
//   const Posting({super.key});

//   @override
//   State<Posting> createState() => _PostingScreenState();
// }

// class _PostingScreenState extends State<Posting> {
  

//   int? selectedPost = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: .9.sh,
//             width: 1.sw,
//             child: DropdownButton(
//               hint: Text('Make a Post'),
//               value: selectedPost,
//               items: [
//                 DropdownMenuItem(
//                   child: Text('Take a Photo'),
//                   value: 1,
//                 ),
//                 DropdownMenuItem(child: Text('Upload from Gallery'), value: 2)
//               ],
//               onChanged: (newValue) {
//                 if (newValue == 1) {
//                   pickImageCamera();
//                 }
//                 if (newValue == 2) {
//                   pickImageGallery();
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => PostingScreen(imageFile)));
//                 }
//                 // setState(() {
//                 //   selectedPost = newValue;
//                 // });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
