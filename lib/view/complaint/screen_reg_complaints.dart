import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/complaint/delete_complaint.dart';
import 'package:hardware_pro/view/complaint/reg_new_compliant.dart';
import 'package:provider/provider.dart';

class ScreenRegComplaints extends StatelessWidget {
  const ScreenRegComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          // Stack(
          //   children: [
          //     SizedBox(
          //       height: 45,
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 30, right: 50),
          //         child: TextField(
          //             decoration: InputDecoration(
          //                 hintText: "   Search",
          //                 hintStyle: const TextStyle(
          //                     color: Colors.grey,
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.w400),
          //                 border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(30)))),
          //       ),
          //     ),
          //     const Padding(
          //       padding: EdgeInsets.only(
          //         left: 370,
          //       ),
          //       child: Icon(
          //         Icons.home_filled,
          //         size: 40,
          //         color: Color.fromARGB(255, 72, 70, 70),
          //       ),
          //     )
          //   ],
          // ),
          Consumer<FirestoreDatabase>(builder: (context, firestore, child) {
            return FutureBuilder(
                future: firestore.fetchcurrentUserComplaint(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  return Container(
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 230, 224, 224),
                          ),
                          color: const Color.fromARGB(255, 215, 215, 183),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      width: width,
                      height: hight * .7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios)),
                              const Text(
                                "Your Complaints",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 37, 40, 58),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: firestore.compalintsList.isEmpty
                                ? const Center(
                                    child: Text("No Complaints."),
                                  )
                                : ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data =
                                          firestore.compalintsList[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) {
                                              return ScreenDeleteReg(
                                                registerComplaintModel: data,
                                              );
                                            },
                                          ));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          width: width,
                                          height: hight * .09,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                data.productName.toUpperCase(),
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: width * .1,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        "Status: ",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    37,
                                                                    40,
                                                                    58),
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        data.complaintStatus,
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                      "Registerd date: ${data.complaintDate}",
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 37, 40, 58),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: firestore.compalintsList.length),
                          )
                        ],
                      ));
                });
          }),
          const Expanded(flex: 2, child: SizedBox()),
          SizedBox(
            width: 270,
            height: 42,
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color.fromARGB(255, 255, 162, 21)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return RegNewComplaint();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
                label: const Text(
                  "New Complaint",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          const Expanded(flex: 2, child: SizedBox())
        ]),
      ),
    );
  }
}
