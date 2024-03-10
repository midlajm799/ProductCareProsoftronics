import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/colors.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/warrenty/claimWarranty.dart';
import 'package:hardware_pro/view/warrenty/screen_RegisterWarranty.dart';
import 'package:provider/provider.dart';

class ViewRegisterdWarrenty extends StatelessWidget {
  const ViewRegisterdWarrenty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 235, 232, 232),
                ),
                color: const Color.fromARGB(255, 244, 241, 241),
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            width: 450,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 27,
                      )),
                  const Text(
                    "Registered\nProducts",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 153, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 35,
          // ),
          Consumer<FirestoreDatabase>(builder: (context, firebase, child) {
            return FutureBuilder(
                future: firebase.fetchuserWarrnty(),
                builder: (context, snashot) {
                  if (snashot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  return Expanded(
                    child: firebase.warrentyList.isEmpty
                        ? const Center(
                            child: Text("No warrenty"),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              final warrenty = firebase.warrentyList[index];
                              return Container(
                                margin: const EdgeInsets.all(10),
                                width: 330,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 245, 243, 243),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 244, 240, 240),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(blurRadius: 1)
                                    ]),
                                height: 130,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product name : ${warrenty.name.toUpperCase()}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Order no:  ${warrenty.orderId}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Serial no:  ${warrenty.srialnumber}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                border: Border.all(
                                                    color: warrentyStatusColor(
                                                        warrenty
                                                            .warrentyStatus))),
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                width: 135,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                child: Text(
                                                  warrenty.warrentyStatus,
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: warrentyStatusColor(
                                                          warrenty
                                                              .warrentyStatus)),
                                                )),
                                          ),
                                          warrenty.warrentyStatus == "APPROVED"
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  20)),
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              183, 13, 1))),
                                                  child: SizedBox(
                                                    height: 30,
                                                    width: 165,
                                                    child: OutlinedButton.icon(
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(20),
                                                          ),
                                                        )),
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ClaimWarrenty(
                                                                            registerWarrentyModel:
                                                                                warrenty,
                                                                          )));
                                                        },
                                                        icon: const Icon(
                                                            Icons.add,
                                                            size: 17,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    190,
                                                                    13,
                                                                    0)),
                                                        label: const Text(
                                                          "claim warranty",
                                                          style: TextStyle(
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      176,
                                                                      12,
                                                                      0)),
                                                        )),
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 30,
                                                  width: 165,
                                                ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: firebase.warrentyList.length),
                  );
                });
          })

          // const SizedBox(
          //   height: 350,
          // ),
          ,
          SizedBox(
            width: 310,
            height: 50,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 65, 76, 135),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenRegWarranty();
                    },
                  ));
                },
                icon: const Icon(Icons.add),
                label: const Text(
                  "New Product",
                  style: TextStyle(fontSize: 18),
                )),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
