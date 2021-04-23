import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {
  runApp(MyAdmin());
}

class MyAdmin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('catalog');
  CollectionReference users1 = FirebaseFirestore.instance.collection('users');
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();
  final myController7 = TextEditingController();
  final myController8 = TextEditingController();
  final myController9 = TextEditingController();
  final myController10 = TextEditingController();
  final myController11 = TextEditingController();
  final myController12 = TextEditingController();
  final myController13 = TextEditingController();
  final myController14 = TextEditingController();
  final myController15 = TextEditingController();
  final myController16 = TextEditingController();
  final myController17 = TextEditingController();
  final myController18 = TextEditingController();
  final myController19 = TextEditingController();
  final myController20 = TextEditingController();
  final myController21 = TextEditingController();
  final myController22 = TextEditingController();
  final myController23 = TextEditingController();
  final myController24 = TextEditingController();
  final myController25 = TextEditingController();
  final myController26 = TextEditingController();
  final myController27 = TextEditingController();
  final myController28 = TextEditingController();
  final myController29 = TextEditingController();
  final myController30 = TextEditingController();
  final myController31 = TextEditingController();
  final myController32 = TextEditingController();
  final myController33 = TextEditingController();
  final myController34 = TextEditingController();
  final myController35 = TextEditingController();
  final myController36 = TextEditingController();
  final myController37 = TextEditingController();
  final myController38 = TextEditingController();
  final myController39 = TextEditingController();

  int _counter = 0;
  final firestoreInstance = FirebaseFirestore.instance;


  Future<void> _onPressed() {
    return users
        .doc(myController2.text.toString())
        .set({ "description": myController1.text.toString(),
      "id": myController2.text.toString(),
      "item_code": myController2.text.toString(),
      "item_description": myController1.text.toString(),
      "manufracturer_brand": myController3.text.toString(),
      "prepared_by": myController4.text.toString(),
      "issue_date": myController5.text.toString(),
      "issued_by": myController6.text.toString(),
      "company_name": myController7.text.toString(),
      "colour": myController8.text.toString(),
      "type": myController9.text.toString(),
      "manufacturing_type": myController10.text.toString(),
      "material_type": myController11.text.toString(),
      "material_specification": myController12.text.toString(),
      "bootomdia_uom": myController13.text.toString(),
      "bottomdia_tolerance": myController14.text.toString(),
      "bottomdia_product": myController15.text.toString(),
      "volume_uom": myController16.text.toString(),
      "volume_tolerance": myController17.text.toString(),
      "volume_product": myController18.text.toString(),
      "shape_uom": myController19.text.toString(),
      "shape_tolerance": myController20.text.toString(),
      "shape_product": myController21.text.toString(),
      "thickness_uom": myController22.text.toString(),
      "thickness_tolerance": myController23.text.toString(),
      "thickness_product": myController24.text.toString(),
      "dimension_uom": myController25.text.toString(),
      "dimesnsion_tolerance": myController26.text.toString(),

      "dimension_product": myController27.text.toString(),
      "flatsize_uom": myController28.text.toString(),
      "flatsize_tolerance": myController29.text.toString(),
      "flatsize_product": myController30.text.toString(),
      "foldedsize_uom": myController31.text.toString(),
      "foldedsize_tolerance": myController32.text.toString(),
      "foldedsize_product": myController33.text.toString(),
      "height_uom": myController34.text.toString(),
      "height_tolerance": myController35.text.toString(),
      "height_product": myController36.text.toString(),

      "packaging_size": myController37.text.toString(),
      "packaging_type": myController38.text.toString(),
      "notes": myController39.text.toString(),

    })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }


  Future<void>  _onPressed1() {
    return users1
        .doc(myController2.text.toString())
        .set({ "description": myController1.text.toString(),
      "id": myController2.text.toString(),

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
          // color: new Color.fromRGBO(247,247,247,255)),
          //width: MediaQuery.of(context).size.width / 2,
         // widthFactor: 0.4,

              child: Center(

               child: Column(
                 children: [

                 Container(
                    margin: const EdgeInsets.only(top: 30,left: 20),
                    //height: 150,
                    width: MediaQuery.of(context).size.width / 2,

                      child:  Text("Basic Details", textAlign: TextAlign.center,style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),


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
                        child: TextFormField(
                          decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,

                            ),
                          ),
                          hintText: 'Description of item',

                          labelText: 'Description details',

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
                          hintText: 'Enter Product ID',
                          labelText: 'Item Id',
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
                          hintText: 'Enter Manufracturer Brand',
                          labelText: 'Manufracturer Brand',
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
                          hintText: 'Enter Prepared By',
                          labelText: 'Prepared By',
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
                          hintText: 'Enter Issue Date',
                          labelText: 'Issued Date',
                        ),
                          controller: myController5,
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
                          hintText: 'Enter Issued By',
                          labelText: 'Issued By',
                        ),
                          controller: myController6,
                        ),
                      ),


                    ],
                  ),
                ),
                 Container(
                  margin: const EdgeInsets.only(top: 30,left: 20,bottom: 20),
                   // height: 150,
                    width: MediaQuery.of(context).size.width / 2,

                      child:  Text("Specification", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),


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
                          hintText: 'Enter Brand/Company NAme',
                          labelText: 'Company Name',
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
                          hintText: 'Enter Colour',
                          labelText: 'Colour',
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
                          hintText: ' Type',
                          labelText: 'Type',
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
                          hintText: 'Enter Manufacturing Type',
                          labelText: 'Manufacturing type',
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
                          hintText: 'Enter Material Type',
                          labelText: 'Material Type',
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
                          hintText: 'Enter Material Specification',
                          labelText: 'Material Specification',
                        ),
                          controller: myController12,
                        ),
                      ),


                    ],
                  ),
                ),
                   Container(
                    margin: const EdgeInsets.only(top: 30,left: 20,bottom: 20),
                   // height: 150,
                    width: MediaQuery.of(context).size.width / 2,

                      child:  Text("Dimensional Parameter's", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),


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
                          hintText: 'Enter Bootom Dia UOM',
                          labelText: 'Bootom Dia UOM',
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
                          hintText: 'Enter Bottom Dia Tolerance',
                          labelText: 'Bottom Dia tolerance',
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
                          hintText: 'Enter Bottom dia product',
                          labelText: 'Bottom dia product',
                        ),
                          controller: myController15,
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
                          hintText: 'Enter Volume UOM',
                          labelText: 'Volume UOM',
                        ),
                          controller: myController16,
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
                          hintText: 'Enter Volume Tolerance',
                          labelText: ' Volume Tolerance',
                        ),
                          controller: myController17,
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
                          hintText: 'Enter Volume Product',
                          labelText: 'Volume Product',
                        ),
                          controller: myController18,
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
                          hintText: 'Enter Shape UOM',
                          labelText: 'Shape UOM',
                        ),
                          controller: myController19,
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
                          hintText: 'Enter Shape Tolerance',
                          labelText: 'Shape Tolerance',
                        ),
                          controller: myController20,
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
                          hintText: 'Enter Shape Product',
                          labelText: 'Shape Product',
                        ),
                          controller: myController21,
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
                          hintText: 'Enter Thickness UOM',
                          labelText: 'Thickness UOM',
                        ),
                          controller: myController22,
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
                          hintText: 'Enter Thickness Tolerance',
                          labelText: 'Thickness Tolerance',
                        ),
                          controller: myController23,
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
                          hintText: 'Enter Thickness Product',
                          labelText: 'Thickness Product',
                        ),
                          controller: myController24,
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
                          hintText: 'Enter Dimension UOM',
                          labelText: 'Dimension UOM',
                        ),
                          controller: myController25,
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
                          hintText: 'Enter Dimension Tolerance',
                          labelText: 'Dimension Tolerance',
                        ),
                          controller: myController26,
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
                          hintText: 'Enter Dimensional Product',
                          labelText: 'Dimensional Product',
                        ),
                          controller: myController27,
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
                          hintText: 'Enter Flat size UOM',
                          labelText: 'Flat size UOM',
                        ),
                          controller: myController28,
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
                          hintText: 'Enter Flat size Tolerance',
                          labelText: 'Flat size Tolerance',
                        ),
                          controller: myController29,
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
                          hintText: 'Enter Flat Size Product',
                          labelText: 'Flat Size Product',
                        ),
                          controller: myController30,
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
                          hintText: 'Enter folded size UOM',
                          labelText: 'Folded size UOM',
                        ),
                          controller: myController31,
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
                          hintText: 'Enter Folded Size Tolerance',
                          labelText: 'Folded Size Tolerance',
                        ),
                          controller: myController32,
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
                          hintText: 'Enter Folded Size Product',
                          labelText: 'Folded Size Product',
                        ),
                          controller: myController33,
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
                          hintText: 'Enter Height UOM',
                          labelText: 'Height UOM',
                        ),
                          controller: myController34,
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
                          hintText: 'Enter Height Tolerance',
                          labelText: 'Height Tolerance',
                        ),
                          controller: myController35,
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
                          hintText: 'Enter Height Product',
                          labelText: 'Height Product',
                        ),
                          controller: myController36,
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
                   // height: 150,
                    width: MediaQuery.of(context).size.width / 2,

                      child:  Text("Packaging Detail's", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),


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
                          hintText: 'Enter Packaging Size',
                          labelText: 'Packaging Size',
                        ),
                          controller: myController37,
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
                          hintText: 'Enter Packaging Type',
                          labelText: 'Packaging Type',
                        ),
                          controller: myController38,
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
                          hintText: 'Enter Notes',
                          labelText: 'Notes',
                        ),
                          controller: myController39,
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
                            _onPressed1();
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
      ),
    );
  }
}
