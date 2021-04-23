import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class invoices extends StatelessWidget{
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
              child: Text("Invoices",style: TextStyle(fontSize: 30),textAlign: TextAlign.left,),

            ),
            Container(
              margin: EdgeInsets.only(left: 05),
              child: Card(
                child: Row(
                  children: [

                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Invoice Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),

                          ],
                        ) ),

                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Created On",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),

                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Credit Note Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),

                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Status",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),

                          ],
                        ) ),
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("PO Number",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),

                          ],
                        ) ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


/*
Container(

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
 */