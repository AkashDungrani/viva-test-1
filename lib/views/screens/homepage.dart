import 'package:flutter/material.dart';

import '../../models/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> insertKey = GlobalKey<FormState>();

  TextEditingController customerController = TextEditingController();
  TextEditingController billController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  int? customer;
  int? bill;
  int? sum;
  int? tax;
  int? seprateprice;
  int percentage = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custome Splitter App")),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
            key: insertKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(),
                  controller: customerController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Number of customer.";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    customer = int.parse(val!);
                  },
                  decoration: InputDecoration(
                    labelText: "Number of Customer",
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                Divider(),
                TextFormField(
                  style: TextStyle(),
                  controller: billController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Taxable Amount.";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    bill = int.parse(val!);
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Taxable Amount",
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                Divider(),
                TextFormField(
                  style: TextStyle(),
                  controller: taxController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Tax Amount.";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    tax = int.parse(val!);
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Tax Amount",
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (insertKey.currentState!.validate()) {
                        insertKey.currentState!.save();
                        Globals.sum = bill! + tax!;
                        print("${sum}");
                      }
                    },
                    child: Text("Calculate")),
                Text("Total is ${sum}"),
              ],
            )),
      ),
    );
  }
}
