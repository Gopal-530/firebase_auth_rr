import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:html';
import 'dart:js' as js;
import 'package:shared_preferences/shared_preferences.dart';


class purchase extends StatefulWidget{
  @override
  purch createState() => purch();
  }

class purch extends State<purchase>{

  Icon firstIcon = Icon(
    Icons.notification_important, // Icons.favorite
    color: Colors.blueAccent, // Colors.red
    size: 35,
  );
  DropdownButton butn = DropdownButton<String>(

      items: <String>['Processed', 'In-transit', 'Delivered', 'Payment Received'].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (String data) {
        Fluttertoast.showToast(
          msg: "This is Toast messaget",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      },
      hint: Text("Select",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w400), textAlign: TextAlign.center

        //and here

      )
  );
  String gopal;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Container(
      child: Column(
        children: [

          Container(
            margin: EdgeInsets.only(left: 30,top: 30,bottom: 0),
            width: double.infinity,
            child: Text("Order Status",style: TextStyle(fontSize: 30,color: Colors.blueGrey),textAlign: TextAlign.left,),
          ),
          Container(
            height: 110,
            margin: EdgeInsets.only(left: 20,top: 10,right: 20),
            //r margin: EdgeInsets.only(bottom: 20),
            child: Card(

                child:Row(
                  children: [
                    Container(


                        /*
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).accentColor),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),

                          )
                      ),*/
                        child:Container(
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child:  Column(
                            children: [
                              Text("Filter",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),

                              Container(
                               // height: 30,
                               // width: 100,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).accentColor),
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),

                                    )
                                ),
                                //borderRadius: BorderRadius.circular(18.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10,right: 10,),
                                        child: new DropdownButton<String>(

                                            items: <String>['Processed', 'In-transit', 'Delivered', 'Payment Received'].map((String value) {
                                              return new DropdownMenuItem<String>(
                                                value: value,
                                                child: new Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String data) {
                                              setState(() {
                                                gopal=data;


                                              });




                                            },
                                            hint: Text("Select Order Status",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400), textAlign: TextAlign.center

                                              //and here

                                            )
                                        ),
                                      )

                                      /*child: GestureDetector(
                                  child: Icon(
                                      Icons.list
                                  ),
                                  //onTap:  ,
                                )*/

                                    )
                            ],
                          )
                        )

                    ),
                   /* Container(
                      margin: EdgeInsets.only(left: 20),
                      child:
                      Container(
                        width: 30,
                        height: 30,
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Colors.black,
                              size: 30,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 5),
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffc32c37),
                                    border: Border.all(color: Colors.white, width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Center(
                                    child: Text(
                                      "5",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),*/
                    Expanded(

                        child:Container(
                          margin: EdgeInsets.only(right: 20,bottom: 30),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: OutlineButton(
                              child: Icon(Icons.add),
                              borderSide: BorderSide(color: Colors.blue, width: 1),
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Additem()));


                              },
                            ),
                          ),
                        )
                    ),


                  ],
                )
            ),

          ),


          Container(
            margin: EdgeInsets.all(20),
            child: Card(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                          child:Container(
                              margin: EdgeInsets.only(left: 23),
                              child: Column(
                                children: [
                                  Text("Serial Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              )
                          ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(left: 25),
                              child: Column(
                                children: [
                                  Text("Customer",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(left: 23),
                              child: Column(
                                children: [
                                  Text("PO Date",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(left: 23),
                              child: Column(
                                children: [
                                  Text("PO Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Text("Order Status",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(left: 23),
                              child: Column(
                                children: [
                                  Text("Invoice Date",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text("Invoice Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text("Invoice Amount",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(right: 5),
                              child: Column(
                                children: [
                                  Text("GRN Date",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text("GRN Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                  Text("Amount on GRN",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                  Text("Payment Status",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                  Text("Payment Invoice Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text("Discrepency",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),
                        Expanded(
                          child:Container(

                              margin: EdgeInsets.only(right: 13),
                              child: Column(
                                children: [
                                  Text("Download",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

                                ],
                              ) ),
                        ),

                      ],
                    ),
                    Container(
                      child: purchase1(text: gopal,),
                    ),
                  ],
                ),
              )
            ),

          ),


        ],
      ),

    );
  }
}

class purchase1 extends StatelessWidget{



  final String text;
  purchase1({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();


    Query users = FirebaseFirestore.instance.collection('Order_Status').where('order_status' ,isEqualTo: text);
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

            return new SingleChildScrollView(
              child: Container(

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
                                            child: Text(document['serial_number'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.black54),),

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
                                            child:  Text(document['custumer'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

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
                                            child:   Text(document['po_date'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

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
                                              child:GestureDetector(
                                                child: text(),
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
                                           child:  Text(document['Payment_status'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

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
                                           child:  Text(document['payment_invoice_number'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

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
                                           child: Text(document['descri'],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black54),),

                                         )
                                        ],
                                      ) ),
                                ),
                                Expanded(
                                  child:Container(

                                      margin: EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: [
                                          RaisedButton(
                                              onPressed:() async {

                                                js.context.callMethod('open', ['https://t3.ftcdn.net/jpg/00/73/43/82/240_F_73438236_hkJ5G2Oizln5A8YyDA93c7ZCKxvwvXkS.jpg']);
                                              },
                                              child:Center(
                                                child: Text("Download",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),),
                                              )
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

class _MyHomePageState extends State<Additem> {
  CollectionReference users = FirebaseFirestore.instance.collection('Order_Status');
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController6 = TextEditingController();
  final myController7 = TextEditingController();
  final myController8 = TextEditingController();
  final myController9 = TextEditingController();
  final myController10 = TextEditingController();
  final myController11 = TextEditingController();
  final myController12 = TextEditingController();
  final myController13 = TextEditingController();
  final myController14 = TextEditingController();

  int _counter = 0;
  final firestoreInstance = FirebaseFirestore.instance;
  Future<void> _onPressed() {

    return users
        .doc(myController2.text.toString())
        .set({ "serial_number" : myController1.text.toString(),
      "custumer" : myController2.text.toString(),
      "po_date" : myController3.text.toString(),
      "po_number" : myController4.text.toString(),
      "order_status" :"Processed",
      "invoice_date" : myController6.text.toString(),
      "invoice_number" : myController7.text.toString(),
      "invoice_amount" : myController8.text.toString(),
      "GRN_date" : myController9.text.toString(),
      "GRN_number" : myController10.text.toString(),
      "Amount_on_GRN" : myController11.text.toString(),
      "Payment_status" : myController12.text.toString(),
      "payment_invoice_number" : myController13.text.toString(),
      "descri" : myController14.text.toString(),

    })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:SingleChildScrollView(

        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.4,
            child: Column(
              children: [

                Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child:  Text("Enter Order Details", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),

                    )
                ),
                Container(
                  //width: MediaQuery.of(context).size.width / 2,

                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /*const ListTile(
                  leading: Icon(Icons.album, size: 45),
                  title: Text('Sonu Nigam'),
                  subtitle: Text('Best of Sonu Nigam Song'),
                ),*/

                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20,top: 20),
                        child: TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Serial Number',
                          labelText: 'Serial Number',

                        ),
                          controller: myController1,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Customer Name',
                          labelText: 'Customer Name',
                        ),
                          controller: myController2,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter PO Date',
                          labelText: 'PO Date',
                        ),
                          controller: myController3,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter PO Number',
                          labelText: 'PO Number',
                        ),
                          controller: myController4,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Invoice Date',
                          labelText: 'Invoice Date',
                        ),
                          controller: myController6,
                        ),
                      ),


                    ],
                  ),
                ),

                Container(
                  //width: MediaQuery.of(context).size.width / 2,

                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /*const ListTile(
                  leading: Icon(Icons.album, size: 45),
                  title: Text('Sonu Nigam'),
                  subtitle: Text('Best of Sonu Nigam Song'),
                ),*/


                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Invoice Number',
                          labelText: 'Invoice Number',
                        ),
                          controller: myController7,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Invoice Amount',
                          labelText: 'Invoice Amount',
                        ),
                          controller: myController8,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'GRN Date',
                          labelText: 'Enter GRN Date',
                        ),
                          controller: myController9,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter GRN Number',
                          labelText: 'GRN Number',
                        ),
                          controller: myController10,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Amount on GRN',
                          labelText: 'GRN Amount',
                        ),
                          controller: myController11,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Payment Status',
                          labelText: 'Payment Status',
                        ),
                          controller: myController12,
                        ),
                      ),


                    ],
                  ),
                ),

                Container(
                  //width: MediaQuery.of(context).size.width / 2,

                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /*const ListTile(
                  leading: Icon(Icons.album, size: 45),
                  title: Text('Sonu Nigam'),
                  subtitle: Text('Best of Sonu Nigam Song'),
                ),*/


                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Payment Invoice Number',
                          labelText: 'Payment Invoice Number',
                        ),
                          controller: myController13,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Discrepency',
                          labelText: 'Discrepency',
                        ),
                          controller: myController14,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child:TextFormField(decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Upload PO',
                          labelText: 'upload',
                        ),
                         // controller: myController15,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.only(left: 15,right: 15,top: 25,bottom: 20),
                        child: RaisedButton(

                          child: Text("Add ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          color: Colors.blue,
                          // shape: new RoundedRectangleBorder(
                          //   borderRadius: new BorderRadius.circular(25.0)),
                          onPressed: (){
                            _onPressed();

                            /*
                            if(myController.text=="gopal@therrgroup.in" && myController1.text=="12345" || myController.text=="animesh@therrgroup.in" && myController1.text=="12345"){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Firstpage()),
                              );
                            }else{
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the that user has entered by using the
                                    // TextEditingController.
                                    content: Text("Wrong ID/Password ..Please Try Again"),
                                  );
                                },
                              );
                            }
*/

                          },

                        ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

showAlertDialog(BuildContext context) {
 final myController90 = TextEditingController();
 final myController91 = TextEditingController();
 final myController92 = TextEditingController();

  // set up the buttons
  Widget remindButton = FlatButton(

    child: Text("In-Transit"),
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
              hintText: 'Enter Delivery ID',

          ),
          controller: myController90,
        ),
      ),

          Container(
            margin: EdgeInsets.only(left: 20,bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: 'DD/MM/YYYY',
                  labelText: 'Enter Expected Delivery Date'


              ),
              controller: myController91,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: 'Enter Delivery Address',
              ),
              controller: myController92,
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
                    'Delivery ID':k,
                   'Delivery_date':myController91.text,
                   'Delivery_address':myController92.text,

                    'order_status':"In-transit",
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
    title: Text("Ready to update order status ?"),
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



//sesion save DocumnetID ///==> Document id of firestore firebase<==///


class Additem extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}