import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/addressModel.dart';
import 'package:hardware_pro/Model/cartmodel.dart';
import 'package:hardware_pro/Model/order_model.dart';
import 'package:hardware_pro/View%20Model/controller.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/shop/order_successfu.dart';
import 'package:provider/provider.dart';

class ScreenPayment extends StatelessWidget {
  List<CartModel> cartmodel;
  UserAddressModel userAddressModel;
  int totalAmount;
  ScreenPayment(
      {super.key,
      required this.cartmodel,
      required this.totalAmount,
      required this.userAddressModel});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;

    String uPI = "lib/assets/UPI.jpeg";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<Controller>(builder: (context, controller, child) {
          return Column(
            children: [
              Consumer<Controller>(builder: (context, controller, child) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 235, 232, 232),
                      ),
                      color: const Color.fromARGB(255, 244, 241, 241),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40))),
                  width: 450,
                  height: 150,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          )),
                      const Text(
                        "Payment",
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 83, 126),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 150, width: 150, child: Image.asset(uPI)),
              SizedBox(
                height: ht * .1,
              ),
              RadioListTile(
                title: const Text("Cash on delivery"),
                value: 1,
                groupValue: controller.selectedRadioButton,
                onChanged: (value) {
                  controller.onselectedRadio(value);
                },
              ),
              RadioListTile(
                title: const Text("Net banking"),
                value: 2,
                groupValue: controller.selectedRadioButton,
                onChanged: (value) {
                  controller.onselectedRadio(value);
                },
              ),
              RadioListTile(
                title: const Text("UPI"),
                value: 3,
                groupValue: controller.selectedRadioButton,
                onChanged: (value) {
                  controller.onselectedRadio(value);
                },
              ),
              SizedBox(
                height: ht * .2,
              ),
              Consumer<FirestoreDatabase>(
                  builder: (context, firestoree, child) {
                return SizedBox(
                  height: 40,
                  width: 130,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        showLoadingIndicator(
                            context, "Your order is Processing..");
                        switch (controller.selectedRadioButton) {
                          case 1:
                            {
                              await firestoree
                                  .buyProductFromCart(OrderModel(
                                    status: "PENDING",
                                      date: DateTime.now().toString(),
                                      cartModel: cartmodel,
                                      userAddressModel: userAddressModel,
                                      totalAmount: totalAmount,
                                      paymentMode: 'Cash on delivery',
                                    ))
                                  .then((value) {
                                showSuccessMessage(
                                    context, "Order is successfull..!");
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) =>
                                      const ScreenOrderSucsessfull(),
                                ));
                              });
                            }
                          case 2:
                            {
                              showErrorMessage(context,
                                  "Net Banking mode under maintenance..try another payment mode");
                            }
                          case 3:
                            {
                              showErrorMessage(context,
                                  "UPI mode under maintenance..try another payment mode");
                            }
                        }
                      },
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white),
                      )),
                );
              })
            ],
          );
        }),
      ),
    );
  }
}
