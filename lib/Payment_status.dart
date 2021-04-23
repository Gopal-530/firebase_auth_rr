import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:html';
import 'dart:js' as js;
import 'package:shared_preferences/shared_preferences.dart';


class payment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 35,top: 50,bottom: 20),
              child: Text("Payment Status",style: TextStyle(fontSize: 30,color: Colors.blueGrey),textAlign: TextAlign.left,),

            ),
            Container(
              margin: EdgeInsets.only(left: 05,right: 5),
              child: Card(
                child: Row(
                  children: [

                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                           Container(
                             margin: EdgeInsets.only(left: 60,top: 10),
                             child:  Text("PO Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                           )
                          ],
                        ) ),

                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 65,top: 10),
                              child:  Text("Invoice Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                            ),
                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25,top: 10),
                              child:  Text("Payment Advice Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                            ),

                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 10),
                              child:  Text("Mode of Payment",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                            ),

                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 40,top: 10),
                              child:  Text("Payment Date",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                            ),

                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 80,top: 10),
                              child:  Text("Status",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                            ),

                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 65,top: 10),
                              child:  Text("Payment Amount",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                            ),

                          ],
                        ) ),
                  ],
                ),
              ),
            ),
           Container(
             margin: EdgeInsets.only(left: 5,right: 5),
             child: Card(
                 child:Container(
                   padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                   child: Payment1(),
                 )
             ),
           )
          ],
        ),
      ),
    );
  }

}


class Payment1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    Query users = FirebaseFirestore.instance.collection('Order_Status');
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return new ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,


          children: snapshot.data.docs.map((DocumentSnapshot document) {

            return new SingleChildScrollView(
              child:  Container(

                child: ListTile(

                    subtitle: Column(
                      children: [
                        // Text(document['name']),
                        //Text(document['name']),
                        //Text(document['name']),
                        //Text(document['name']),
                        //Image.network(document['age']),
                        Container(




                            child: Row(
                              children: [

                                Expanded(
                                  child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 20),
                                            child:  Text(document['po_number'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                          )
                                        ],
                                      ) ),
                                ),
                                Expanded(
                                  child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: Text(document['invoice_date'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                      )

                                  ),
                                ),
                                Expanded(
                                  child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 20),
                                            child:  Text(document['invoice_number'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                          )
                                        ],
                                      ) ),
                                ),
                                Expanded(
                                  child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 20),
                                            child: Text(document['invoice_amount'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                          )
                                        ],
                                      ) ),
                                ),
                                Expanded(
                                  child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 20),
                                            child:  Text(document['GRN_date'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                          )
                                        ],
                                      ) ),
                                ),
                                Expanded(
                                  child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 20),
                                            child:  Text(document['GRN_number'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                          )
                                        ],
                                      ) ),
                                ),
                                Expanded(
                                  child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 20),
                                            child: Text(document['Amount_on_GRN'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                          )
                                        ],
                                      ) ),
                                ),


                              ],
                            )
                        ),
                      ],
                    )

                ),
              ),
            );

          }).toList(),
        );
      },
    );
  }

}