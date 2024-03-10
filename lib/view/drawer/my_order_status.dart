import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hardware_pro/Model/cartmodel.dart';
import 'package:hardware_pro/utils/colors.dart';
import 'package:hardware_pro/view/drawer/order_history.dart';

class ScreenOrdersStatus extends StatelessWidget {
  List<CartModel> cartList;
  String status;
  ScreenOrdersStatus({super.key, required this.cartList, required this.status});

  @override
  Widget build(BuildContext context) {
    final higth =MediaQuery.of(context).size.height;
        final width =MediaQuery.of(context).size.width;

    String pipiiit = "lib/assets/piiiipiit.jpeg";
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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 15),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    "Orders",
                    style: TextStyle(
                        color: Color.fromARGB(255, 42, 46, 68),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    width: width,
                  height: higth*.15,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 244, 241, 241),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            cartList[index].productModel.productImage,
                            scale: 2,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartList[index]
                                  .productModel
                                  .productName
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.currency_rupee,
                                  size: 17,
                                ),
                                Text(
                                  cartList[index]
                                      .productModel
                                      .price
                                      .toDouble()
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Quantity :${cartList[index].quantity.toString()}"),
                            Text("Total price :${cartList[index].totalAmount}"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              status,
                              style: TextStyle(color: orderstatusColor(status)),
                            )

                            // Row(
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.only(left: 55),
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //             borderRadius:
                            //                 BorderRadius.circular(15),
                            //             border:
                            //                 Border.all(color: Colors.black)),
                            //         width: 141,
                            //         height: 25,
                            //         child: OutlinedButton(
                            //             style: OutlinedButton.styleFrom(
                            //                 shape: RoundedRectangleBorder(
                            //                     borderRadius:
                            //                         BorderRadius.circular(
                            //                             15))),
                            //             onPressed: () {},
                            //             child: const Row(
                            //               children: [
                            //                 Text(
                            //                   "status:",
                            //                   style: TextStyle(
                            //                       fontSize: 13,
                            //                       color: Color.fromARGB(
                            //                           255, 0, 0, 0),
                            //                       fontWeight:
                            //                           FontWeight.bold),
                            //                 ),
                            //                 Text(
                            //                   "Processing",
                            //                   style: TextStyle(
                            //                       fontSize: 13,
                            //                       color: Color.fromARGB(
                            //                           255, 51, 128, 53)),
                            //                 )
                            //               ],
                            //             )),
                            //       ),
                            //     ),
                            //     // const SizedBox(
                            //     //   width: 5,
                            //     // ),
                            //     // SizedBox(
                            //     //   width: 74,
                            //     //   height: 25,
                            //     //   child: Container(
                            //     //     decoration: BoxDecoration(
                            //     //         border:
                            //     //             Border.all(color: Colors.black),
                            //     //         borderRadius:
                            //     //             BorderRadius.circular(15)),
                            //     //     child: OutlinedButton(
                            //     //         style: OutlinedButton.styleFrom(
                            //     //             shape: RoundedRectangleBorder(
                            //     //                 borderRadius:
                            //     //                     BorderRadius.circular(
                            //     //                         15))),
                            //     //         onPressed: () {},
                            //     //         child: const Row(
                            //     //           children: [
                            //     //             Text(
                            //     //               "cancel",
                            //     //               style: TextStyle(
                            //     //                   fontSize: 13,
                            //     //                   color: Color.fromARGB(
                            //     //                       255, 0, 0, 0)),
                            //     //             ),
                            //     //           ],
                            //     //         )),
                            //     //   ),
                            //     // ),
                            //   ],
                            // ),
                          ],
                        ),
                        const SizedBox()
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: cartList.length),
          )
        ],
      ),
    );
  }
}
