import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:hardware_pro/View%20Model/controller.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/firebase_options.dart';

import 'package:hardware_pro/view/warrenty/splashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screentype) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<FirestoreDatabase>(
            create: (context) => FirestoreDatabase(),
          ),
          ChangeNotifierProvider<Controller>(
            create: (context) => Controller(),
          )
        ],
        child: MaterialApp(
          
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen()),
      );
    });
  }
}
// Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 55),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   border: Border.all(color: Colors.black)),
//                               width: 141,
//                               height: 25,
//                               child: OutlinedButton(
//                                   style: OutlinedButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(15))),
//                                   onPressed: () {},
//                                   child: const Row(
//                                     children: [
//                                       Text(
//                                         "status:",
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color.fromARGB(255, 0, 0, 0),
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         "Processing",
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color.fromARGB(
//                                                 255, 51, 128, 53)),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           SizedBox(
//                             width: 74,
//                             height: 25,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.black),
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: OutlinedButton(
//                                   style: OutlinedButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(15))),
//                                   onPressed: () {},
//                                   child: const Row(
//                                     children: [
//                                       Text(
//                                         "cancel",
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color:
//                                                 Color.fromARGB(255, 0, 0, 0)),
//                                       ),
//                                     ],
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),