import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/register_complaint_model.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/ScreenHome.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScreenDeleteReg extends StatelessWidget {
  RegisterComplaintModel registerComplaintModel;
  ScreenDeleteReg({super.key, required this.registerComplaintModel});
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  String time = DateFormat('h:mm a').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FirestoreDatabase>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 230, 224, 224),
                    ),
                    color: const Color.fromARGB(255, 247, 247, 247),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                width: 460,
                // height: 460,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 27,
                            )),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "BACK",
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 43, 72),
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Product Name/ID:",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 39, 43, 72)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _mytextBox(width,
                              "${registerComplaintModel.productName}(${registerComplaintModel.productId})"),
                          const Text(
                            "Order Number",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 39, 43, 72)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _mytextBox(width, registerComplaintModel.orderId),
                          const Text(
                            "Complaint Id",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 39, 43, 72)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _mytextBox(width, registerComplaintModel.complaintId),
                          const Text(
                            "Purchase Date",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 39, 43, 72)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _mytextBox(width, registerComplaintModel.orderDate),
                          const Text(
                            "Complainted Date",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 39, 43, 72)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _mytextBox(
                              width, registerComplaintModel.complaintDate),
                          const Text(
                            "Contact no.",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 39, 43, 72)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _mytextBox(
                              width, registerComplaintModel.contactNumber),
                          const Text(
                            "Complaint",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 39, 43, 72)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _mytextBox(width,
                              "${registerComplaintModel.complaint}:-\n\n${registerComplaintModel.description}",
                              size: 14.0,
                              hit: 100.0,
                              alignment: Alignment.topLeft)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Status:"),
                        Text(
                          registerComplaintModel.complaintStatus,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 47,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: const Color.fromARGB(255, 39, 43, 72),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      print(registerComplaintModel.complaintId);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text("Confirm Deletion"),
                              actions: [
                                Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    controller: controller,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter the id before verify";
                                      } else if (value !=
                                          registerComplaintModel.complaintId) {
                                        return "before delete re-check id";
                                      } else {
                                        return null;
                                      }
                                    },
                                    maxLines: 1,

                                    decoration: InputDecoration(
                                        suffixIcon: TextButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // Navigator.of(context).pop();
                                                // showLoadingIndicator(
                                                //     context, "Please wait");
                                                Future.delayed(const Duration(
                                                        seconds: 3))
                                                    .then((value) async {
                                                  provider.deleteComplaint(
                                                      controller.text,
                                                      date,
                                                      time);
                                                }).then((value) {
                                                  showSuccessMessage(context,
                                                      "Complaint deleted");
                                                });
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MainPage(),
                                                ));
                                              }
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Delete",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )),
                                        hintText: "Enter the Complaint id here",
                                        border: const OutlineInputBorder()),
                                    // decoration: InputDecoration(),
                                  ),
                                )
                              ]);
                        },
                      );

                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) {
                      //     return const ScreenNoCompl();
                      //   },
                      // ));
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _mytextBox(width, text, {size, hit, AlignmentGeometry? alignment}) {
    return Container(
        padding: const EdgeInsets.only(left: 5),
        alignment: alignment ?? Alignment.centerLeft,
        height: hit ?? 38,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), color: Colors.white),
        child: Text(
          text,
          style: TextStyle(
              fontSize: size ?? 19,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 93, 92, 92)),
        ));
  }
}
