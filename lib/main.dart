

import 'package:flutter/material.dart';
import 'package:royal_palm_villa/Models/models/transaction/exportTransaction.dart';
import 'package:royal_palm_villa/Models/models/transaction/viewTransactionTimeLine.dart';
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
  ExportTransactionResponse? transaction;
  ViewTransactionTimeLineResponse? listOfTransactionResponse;



  @override
  void initState() {
    // TODO: implement initState
    _incrementCounter();
    super.initState();
  }

  void _incrementCounter() async{
       listOfTransactionResponse=await viewTransactionTimeLine.viewTransactionTimeLine(transactionId:1695885157 );
       transaction=await exportTransaction.exportTransaction();
       setState(() {

       });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: listOfTransactionResponse==null?const CircularProgressIndicator(): SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '${
              transaction!.message
              }'
            ),  SelectableText(
              '${
              transaction!.data!.csvDownloadUrl
              }'
            ),

            ListView.builder(
              shrinkWrap: true,
                itemCount: listOfTransactionResponse!.data!.history!.length,
                itemBuilder: (context,index){
              return Column(
                children: [
                  Text(
                      '${
                          ViewTransactionTimeLineHistory.fromJson(listOfTransactionResponse!.data!.history![index]).type
                      }'
                  ),    Text(
                      '${
                          ViewTransactionTimeLineHistory.fromJson( listOfTransactionResponse!.data!.history![index]).message
                      }'
                  ),    Text(
                      '${
                          ViewTransactionTimeLineHistory.fromJson(listOfTransactionResponse!.data!.history![index])
                              .time            }'
                  ),
                ],
              );
            })
          ],
        ),
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
