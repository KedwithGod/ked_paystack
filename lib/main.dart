

import 'package:flutter/material.dart';
import 'package:royal_palm_villa/Models/models/transaction/chargeAuthorization.dart';
import 'package:royal_palm_villa/Models/models/transaction/listTransaction.dart';
import 'package:royal_palm_villa/Models/models/transaction/totalTransaction.dart';
import 'package:royal_palm_villa/Models/models/transaction/verifyTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/verifyTransaction.dart';
import 'package:royal_palm_villa/Models/utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ChargeAuthorizationResponse? transaction;
  TotalTransactionResponse? listOfTransactionResponse;



  @override
  void initState() {
    // TODO: implement initState
    _incrementCounter();
    super.initState();
  }

  void _incrementCounter() async{
       listOfTransactionResponse=await totalTransaction.totalTransactionFunction();
       setState(() {

       });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: listOfTransactionResponse==null?const CircularProgressIndicator(): Column(
        children: [
          Text(
            '${
            listOfTransactionResponse!.message
            }'
          ),    Text(
            '${
            listOfTransactionResponse!.data!.totalVolumeByCurrency!.amount
            }'
          ),    Text(
            '${
            listOfTransactionResponse!.data!.uniqueCustomers
            }'
          ),    Text(
            '${
            listOfTransactionResponse!.data!.pendingTransferByCurrency!.currency
            }'
          ),
        ],
      )
              /*Text(
               '${verificationTransactionDataValue!.data!.amount}'), Text(
               '${verificationTransactionDataValue!.data!.gateWayResponse}'), Text(
               '${verificationTransactionDataValue!.data!.log!.success}'), Text(
               '${verificationTransactionDataValue!.data!.ipAddress}')*/,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
