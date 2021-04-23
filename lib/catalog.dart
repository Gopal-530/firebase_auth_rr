import 'package:firebase_auth_rr/Admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth_rr/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Catalog extends StatefulWidget{
  @override
  catalogpage createState() => catalogpage();
}
class catalogpage extends State<Catalog>{
  int count=0;
  String idd="";
  String named="";
  CollectionReference users1 = FirebaseFirestore.instance.collection('users');

  getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idd = prefs.getString("id");
     named=prefs.getString("name");

    });
  }

  Widget getcontainer(){

    if(count==0){
      return Column(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 60,top: 30,right: 45),
              child:Row(
                children: [
                  Text("Products",style: TextStyle(fontSize: 30,color: Colors.blueGrey,),textAlign: TextAlign.left,),
                  Expanded(
                      child:Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                        child:  Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.black)),
                          child: InkWell(
                            hoverColor: Colors.white,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyAdmin()));
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(
                                  8, 9, 8, 9),
                              child: Text('ADD +',
                                  style: TextStyle(
                                      color:

                                      Colors.black,
                                      fontSize: 12,
                                      fontFamily:
                                      'Roboto-Medium')),
                            ),
                          ),
                        )
                        /*  child: OutlineButton(
                            child: Icon(Icons.add),



                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyAdmin()));


                            },
                          ),*/
                        ),
                      )
                  ),

                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(left: 45,top: 10,right: 45),

            width: double.infinity,
            child: Card(
              child: Container(
                margin: EdgeInsets.only(left: 05),
                child: Row(
                  children: [

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child: Column(
                        children: [
                          Text("Product name",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                          Container(
                              height: 30,
                              width: 100,
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
                              /* child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: (){}
                            ),*/
                              child: Center(
                                child: Text("Search...",style: TextStyle(fontSize: 10),),
                              )
                          )

                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 45,top: 10,right: 45),
            child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                            child:Container(
                              margin: EdgeInsets.only(top: 15,left: 100,bottom: 15),
                              child:  Text("Image",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                            )
                        ),

                        Expanded(
                            child:Container(
                              margin: EdgeInsets.only(top: 15,left: 20,bottom: 15),
                              child:  Text(
                                "Product details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                            )
                        ),
                        Expanded(
                            child:Container(
                              margin: EdgeInsets.only(top: 15,right: 70,bottom: 15),
                              child:  Text("Action",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
                            )
                        ),
                      ],
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: 10),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: users1.snapshots(),
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
                              return new ListTile(

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

                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Theme.of(context).unselectedWidgetColor)
                                              ),
                                              height: 200,

                                              child:  Image.network('https://as1.ftcdn.net/jpg/00/65/77/28/500_F_65772861_kb3pbjsOnuNWuotxS1NIy1Hc4euZrYDS.jpg'),

                                            ),

                                            Expanded(
                                                child:Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Theme.of(context).unselectedWidgetColor)
                                                    ),
                                                    height: 200,


                                                    child:  Column(
                                                      children: [
                                                        Container(
                                                            margin: EdgeInsets.only(top: 105),
                                                            child: Center(
                                                              child: new GestureDetector(
                                                                child: new Text(document['description'],style: TextStyle(fontSize: 18,color: Colors.blue,), textAlign: TextAlign.center,),
                                                                onTap: () {
                                                                  setState(() {


                                                                    count=1;
                                                                    idd=document['id'];
                                                                    named=document['description'];

                                                                  /*  _loadCounter() async {
                                                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                      setState(() {
                                                                        prefs.setString("id",  document['id']);
                                                                        prefs.setString("name", document['description']);


                                                                      });
                                                                    }
                                                                    _loadCounter();
                                                                    getCounter();*/



                                                                  });


                                                                  //  Navigator.push(
                                                                  // context,
                                                                  //  MaterialPageRoute(builder: (context) => TabBarDemo(text: document['id'],)),
                                                                 // );
                                                                },
                                                              ),
                                                            )
                                                        ),
                                                        Container(

                                                          margin: EdgeInsets.only(top: 10),

                                                          child:  Text("ID : "+document['id'],style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),

                                                        )
                                                      ],
                                                    )
                                                )
                                            ),

                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Theme.of(context).unselectedWidgetColor)
                                              ),
                                              height: 200,


                                              width:150,


                                              /* child:  Container(
                                      height: 25,
                                    child: RaisedButton(
                                      child:Text("Action"),
                                      color: Colors.blueAccent,
                                      textColor: Colors.white,
                                      onPressed: () {

                                      },

                                    ),
                                  )*/




                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )

                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),

          ),


        ],
      );
    }else{



      CollectionReference users = FirebaseFirestore.instance.collection('catalog');
  //    getCounter();
      return FutureBuilder<DocumentSnapshot>(
        future: users.doc(idd).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data;

            return  Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 55,bottom: 30),
                    child: Text(named,style: TextStyle(fontSize: 30,color: Colors.blueGrey,),textAlign: TextAlign.left,),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 50,right: 50),
                    child: SizedBox(

                      height: 600,

                      child: DefaultTabController(

                        length: 4,
                        child: MaterialApp(
                          theme: ThemeData(
                            brightness: Brightness.light,
                            primaryColor: Colors.white, //Changing this will change the color of the TabBar
                            accentColor: Colors.cyan[600],
                          ),
                          home: DefaultTabController(
                            length: 4,
                            child: Scaffold(
                              appBar: AppBar(
                                title: Text("Product ID  "+idd),

                                //  centerTitle: true,

                                bottom: TabBar(


                                  tabs: [

                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text("BASIC DETAILS",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child:Text("SPECIFICATION",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text("DIMENSIONAL PARAMETER'S",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child:  Text("PACKAGING DETAILS",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                                    )




                                  ],
                                ),

                              ),
                              body: TabBarView(
                                children: [
                                  Container(

                                    padding: EdgeInsets.all(50),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(left: 20,top: 15),
                                            child: Text("Basic details",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
                                          ),Divider(
                                              color: Colors.black
                                          ),
                                          Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:Column(
                                                            children: [
                                                              Container(
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Item Code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Item Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Manufacturer Brand",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        )
                                                                      ],

                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['item_code'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['item_description'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['manufracturer_brand'].toString(),style: TextStyle(fontSize: 13),),
                                                                        )
                                                                      ],



                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(top: 30),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Prepared By",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Issued Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Issued By",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        )
                                                                      ],

                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['prepared_by'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['issue_date'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['issued_by'].toString(),style: TextStyle(fontSize: 13),),
                                                                        )
                                                                      ],



                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                      ),

                                                      Column(
                                                        children: [
                                                          Image.network(("https://t4.ftcdn.net/jpg/02/52/78/93/240_F_252789346_NjU8UaPbgV9BrQCJLmQh0I3P1DeGdQbr.jpg"),)
                                                        ],


                                                      )
                                                    ],
                                                  )
                                                ],
                                              )


                                          )

                                        ],

                                      ),
                                    ),
                                  ),

                                  Container(

                                    padding: EdgeInsets.all(50),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(left: 20,top: 15),
                                            child: Text("Specification Attributes",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
                                          ),Divider(
                                              color: Colors.black
                                          ),
                                          Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:Column(
                                                            children: [
                                                              Container(
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Brand Company/Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Colour",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        )
                                                                      ],

                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['company_name'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['colour'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['type'].toString(),style: TextStyle(fontSize: 13),),
                                                                        )
                                                                      ],



                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(top: 30),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Manufacturing Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Material Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text("Material Specification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                                        )
                                                                      ],

                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['manufacturing_type'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:150,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['material_type'].toString(),style: TextStyle(fontSize: 13),),
                                                                        ),
                                                                        Container(
                                                                          width:250,
                                                                          margin: EdgeInsets.only(left: 20,top: 15),
                                                                          child: Text(data['material_specification'].toString(),style: TextStyle(fontSize: 13),),
                                                                        )
                                                                      ],



                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                      ),

                                                      Column(
                                                        children: [
                                                          Image.network(("https://t4.ftcdn.net/jpg/02/52/78/93/240_F_252789346_NjU8UaPbgV9BrQCJLmQh0I3P1DeGdQbr.jpg"),)
                                                        ],


                                                      )
                                                    ],
                                                  )
                                                ],
                                              )


                                          )

                                        ],

                                      ),
                                    ),
                                  ),
                                  Container(

                                    padding: EdgeInsets.all(50),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(left: 20,top: 15),
                                            child: Text("Dimensional Parameter's",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
                                          ),Divider(
                                              color: Colors.black
                                          ),
                                          Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Parameters",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text("UOM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text("Tolerance",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text("Product",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                                              ),
                                                            ),

                                                          ],



                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Bottom dia",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['bootomdia_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['bottomdia_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['bottomdia_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),

                                                          ],



                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Volume",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['volume_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['volume_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['volume_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),

                                                          ],



                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Shape",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['shape_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['shape_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['shape_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),

                                                          ],

                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Thickness",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['thickness_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['thickness_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['thickness_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),

                                                          ],



                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Dimension",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['dimension_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['dimesnsion_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['dimension_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),


                                                          ],



                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Flat size(if applicable)",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['flatsize_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['flatsize_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['flatsize_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),

                                                          ],

                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Folded Size(if applicable)",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['foldedsize_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['foldedsize_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['foldedsize_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),


                                                          ],



                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Container(

                                                                  margin: EdgeInsets.only(left: 20,top: 15),
                                                                  child: Text("Height",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                                                )
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['height_uom'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:  Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['height_tolerance'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(

                                                                margin: EdgeInsets.only(left: 20,top: 15),
                                                                child: Text(data['height_product'].toString(),style: TextStyle(fontSize: 13),),
                                                              ),
                                                            ),

                                                          ],



                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              )


                                          )

                                        ],

                                      ),
                                    ),
                                  ),
                                  Container(

                                    padding: EdgeInsets.all(50),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(left: 20,top: 15),
                                            child: Text("Packaging Details",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
                                          ),Divider(
                                              color: Colors.black
                                          ),
                                          Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width:250,
                                                              margin: EdgeInsets.only(left: 20,top: 15),
                                                              child: Text("Packaging Size",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                            ),
                                                            Container(
                                                              width:150,
                                                              margin: EdgeInsets.only(left: 20,top: 15),
                                                              child: Text("Packaging Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                                            ),

                                                          ],

                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width:250,
                                                              margin: EdgeInsets.only(left: 20,top: 15),
                                                              child: Text(data['packaging_size'].toString(),style: TextStyle(fontSize: 13),),
                                                            ),
                                                            Container(
                                                              width:150,
                                                              margin: EdgeInsets.only(left: 20,top: 15),
                                                              child: Text(data['packaging_type'].toString(),style: TextStyle(fontSize: 13),),
                                                            ),

                                                          ],



                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(


                                                    margin: EdgeInsets.only(top: 50),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width:250,
                                                              margin: EdgeInsets.only(left: 20,top: 15),
                                                              child: Text("Notes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                                            ),

                                                          ],

                                                        ),
                                                        Row(
                                                          children: [

                                                            Container(
                                                              width:250,
                                                              margin: EdgeInsets.only(left: 20,top: 10),
                                                              child: Text(data['notes'].toString(),style: TextStyle(fontSize: 15),),
                                                            )
                                                          ],



                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              )


                                          ),

                                        ],

                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            );

            //print(data);
            //_newdata = mydata.documents[_downCounter]["data"];

            return Text("Firestore data is : $data");
          }

          //return Text("loading");
        },
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

     return Container(
        width: double.infinity,
        child: getcontainer(),

    );
  }

}

