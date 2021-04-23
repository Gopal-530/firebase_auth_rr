import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class testing1 extends StatefulWidget{

  tst createState()=> tst();
}

class tst extends State<testing1>{


  String txt='old Button';
  int count=0;
  String text="";
  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      prefs.setString("name", "new Text");
    });
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    text=prefs.getString("name");
    });
  }

  Widget button(){
     return FlatButton(
       child: Text("old button"),

       onPressed: () {
         setState(() {

           incrementCounter();

         count=1;

         });
       },
     );

    }

    Widget button1(){
      _loadCounter();
      return FlatButton(
        child: Text(text),

        onPressed: () {
          setState(() {
            count=0;

          });
        },
      );
    }


    Widget getwidget(){
    if(count==0){
     return button();
    }else{
      return button1();
    }
    }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Column(
        children: [
          Container(
            child: getwidget(),

          )

        ],
      ),

    );

  }

}
///----for web dashboard------https://github.com/flutter/samples/tree/master/experimental/web_dashboard/lib//