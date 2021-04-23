import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:html';
import 'dart:js' as js;
import 'package:shared_preferences/shared_preferences.dart';


class deliveries extends StatelessWidget{

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
              margin: EdgeInsets.only(left: 55,top: 50,bottom: 20),
              child: Text("Deliveries",style: TextStyle(fontSize: 30,color: Colors.blueGrey),textAlign: TextAlign.left,),

            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Card(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Expanded(
                            child: Container(

                                margin: EdgeInsets.only(left: 50),
                                child: Column(
                                  children: [
                                    Text("Delivery ID ",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                  ],
                                ) ),
                          ),

                          Expanded(
                            child:Container(

                                margin: EdgeInsets.only(left: 40),
                                child: Column(
                                  children: [
                                    Text("Status",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                  ],
                                ) ),
                          ),
                          Expanded(
                            child:Container(

                                margin: EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    Text("PO Details",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                  ],
                                ) ),
                          ),
                          Expanded(
                            child:Container(

                                margin: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text("Invoice Number",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                  ],
                                ) ),
                          ),
                          Expanded(
                            child:Container(

                                margin: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text("Expected Date",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                  ],
                                ) ),
                          ),
                          Expanded(
                            child:Container(

                                margin: EdgeInsets.only(left: 0),
                                child: Column(
                                  children: [
                                    Text("Delivery Address",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                  ],
                                ) ),
                          )
                        ],
                      ),
                      Delivery1(),
                    ],
                  ),
                )
              ),
            ),


              ],
        ),
      ),
    );
  }

}

class Delivery1 extends StatefulWidget{

  @override
  delv_ful createState() => delv_ful();
}

class delv_ful extends State<Delivery1>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();


    Query users = FirebaseFirestore.instance.collection('Order_Status').where('order_status', isNotEqualTo: "Pending");
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
            Widget text(){

              if(document['order_status']=="In-transit" || document['order_status']=="pending"){

                return Text(document['order_status'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.red,),);

              } if(document['order_status']=="Processed" || document['order_status']=="processed"){

                return Text(document['order_status'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.blue,),);

              }
              if(document['order_status']=="Payment Received" || document['order_status']=="payment received"){

                return Text(document['order_status'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.green,),);

              }
              if(document['order_status']=="Delivered" || document['order_status']=="delivered"){

                return Text(document['order_status'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.orange,),);

              }

            }
            return new Container(
                margin: EdgeInsets.only(left: 25),

                  child: ListTile(

                      subtitle: Column(
                        children: [
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
                                             child:  Text(document['Delivery ID'],textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.black54),),

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


                                                child:GestureDetector(
                                                  child:Container(
                                                    margin: const EdgeInsets.only(top: 20),
                                                    child:  text(),
                                                  ),
                                                  onTap: () async {


                                                    showAlertDialog(context);

                                                    final prefs = await SharedPreferences.getInstance();

// set value
                                                    prefs.setString('DocumentID',document.id);

                                                  },
                                                )



                                              // text()
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


                                        child: Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(top: 20),
                                              child:   Text(document['invoice_number'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                            )
                                          ],

                                            )
                                        ) ),

                                  Expanded(
                                    child:Container(
                                      height:50,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).dividerColor)
                                      ),

                                      child: Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: Text(document['Delivery_date'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

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
                                            child:   Text(document['Delivery_address'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

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

            );

          }).toList(),
        );
      },
    );


  }

}

showAlertDialog(BuildContext context) {
  final myController90 = TextEditingController();
  final myController91 = TextEditingController();
  final myController92 = TextEditingController();
  // set up the buttons
  Widget remindButton = FlatButton(

    child: Text("Delivered"),
    onPressed:  () {


      AlertDialog alert = AlertDialog(
        title: Text("Update Order Status to Delivered"),
        content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 20,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: 'Enter GRN Number',
              ),
              controller: myController90,
            ),
          ),

          FlatButton(
              child: Text("UPDATE"),
              onPressed:  () async {
                // print(myController90);
                String k=myController90.text;
                final prefs = await SharedPreferences.getInstance();
                String id=prefs.getString('DocumentID');
                FirebaseFirestore.instance.collection('Order_Status').doc(id).update({
                  'GRN_number':k,


                  'order_status':"Delivered",
                  // John Doe
                  // 42
                })
                    .then((value) => print("User Added"))
                    .catchError((error) => print("Failed to add user: $error"));


// set value



                Navigator.of(context, rootNavigator: true).pop('dialog');
                //final prefs = await SharedPreferences.getInstance();
                //  prefs.setString('counter',"Gopal");

              }

          )


        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );




    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Update Order Status"),
    content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
    actions: [
      //launchButton,
      remindButton,

    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}