import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/colors.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/drawer/my_order_status.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Consumer<FirestoreDatabase>(builder: (context, instence, child) {
            return FutureBuilder(
                future: instence.fetchMyorder(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 235, 232, 232),
                            ),
                            color: const Color.fromARGB(255, 244, 241, 241),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        width: 450,
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 30,
                                    )),
                                const Text("Your",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 72, 91, 126),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Text(
                                "Orders",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 72, 91, 126),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        child: instence.myOrderList.isEmpty
                            ? const Center(
                                child: Text("No Orders"),
                              )
                            : ListView.separated(
                                separatorBuilder: (context, orderListIndex) =>
                                    const Divider(),
                                itemCount: instence.myOrderList.length,
                                itemBuilder: (context, index) {
                                  final data = instence.myOrderList[index];

                                  final addressinstence = instence
                                      .myOrderList[index].userAddressModel;
                                  final address =
                                      "${addressinstence.name}${addressinstence.address}\n${addressinstence.area}${addressinstence.city}${addressinstence.state}\nPin :${addressinstence.pincode}\nPhone Number:${addressinstence.phoneNumber}";
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            ScreenOrdersStatus(
                                                status: data.status,
                                                cartList: data.cartModel),
                                      ));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: orderstatusColor(
                                                  data.status))),
                                      width: width,
                                      height: height * .20,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Order Id :${data.status == "COMPLETED" ? data.orderId?.substring(data.orderId!.length - 8) : "NOT AVAILABLE"}"),
                                            Text(
                                                "Payement mode :${data.paymentMode}"),
                                            Text("Address :$address"),
                                            RichText(
                                                text: TextSpan(
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                    children: [
                                                  const TextSpan(
                                                      text: "Status : "),
                                                  TextSpan(
                                                      text: data.status,
                                                      style: TextStyle(
                                                          color:
                                                              orderstatusColor(
                                                                  data.status)))
                                                ])),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                    "Order date :${data.date.substring(0, 10)}"),
                                                Text(
                                                    "Total amount :${data.totalAmount}"),
                                              ],
                                            ),

                                            // data.status == "COMPLETED"
                                            //     ? Text(
                                            //         "Serial no. :${data.serialNumber}")
                                            //     : const SizedBox(),
                                          ]),
                                    ),
                                  );
                                },
                              ),
                      )
                    ],
                  );
                });
          }),
        ),
      ),
    );
  }
}



