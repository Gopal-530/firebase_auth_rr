import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:flutter/material.dart';
void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {


  final String text;

  TabBarDemo({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('catalog');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(text).get(),
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

          return MaterialApp(
            home: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(

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
                  title: Text(text,textAlign: TextAlign.center,),
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