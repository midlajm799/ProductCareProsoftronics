// import 'package:flutter/material.dart';

// class ScreenNoCompl extends StatelessWidget {
//   const ScreenNoCompl({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Stack(
//             children: [
//               SizedBox(
//                 height: 45,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 30, right: 50),
//                   child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "   Search",
//                           hintStyle: const TextStyle(
//                               color: Colors.grey,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w400),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30)))),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(
//                   left: 370,
//                 ),
//                 child: Icon(
//                   Icons.home_filled,
//                   size: 40,
//                   color: Color.fromARGB(255, 72, 70, 70),
//                 ),
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
//             child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color: const Color.fromARGB(255, 230, 224, 224),
//                     ),
//                     color: const Color.fromARGB(255, 215, 215, 183),
//                     borderRadius: const BorderRadius.all(Radius.circular(30))),
//                 width: 460,
//                 height: 500,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
//                         const Text(
//                           "Your Complaints",
//                           style: TextStyle(
//                               fontSize: 22,
//                               color: Color.fromARGB(255, 37, 40, 58),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           borderRadius: BorderRadius.all(Radius.circular(10))),
//                       width: 300,
//                       height: 70,
//                       child: Stack(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 20, top: 15),
//                             child: Text(
//                               "NO NEW \nCOMPLAINTS",
//                               style: TextStyle(
//                                   fontSize: 17, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 190, top: 18),
//                             child: Text(
//                               "Status:",
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 37, 40, 58),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 230, top: 7),
//                             child: TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 "NA",
//                                 style: TextStyle(
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.red),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           SizedBox(
//             width: 270,
//             height: 42,
//             child: OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                     backgroundColor: const Color.fromARGB(255, 255, 162, 21)),
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.add,
//                   size: 32,
//                   color: Colors.white,
//                 ),
//                 label: const Text(
//                   "New Complaint",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 )),
//           )
//         ]),
//       ),
//     );
//   }
// }
