import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:html';
import 'dart:js' as js;
import 'package:shared_preferences/shared_preferences.dart';

class Catalo extends StatefulWidget {
  Catalo({
    Key key,
  }) : super(key: key);

  @override
  State<Catalo> createState()=>_Home();
}

class _Home extends State<Catalo> {
  String title = "Title";
  List<Widget> _fragments =[Fragment1(),Fragment2(),Fragment3()];
  int _currentIndex = 0;
  final List<int> _backstack = [0];

  @override
  Widget build(BuildContext context) {
    //navigateTo(_currentIndex);
    //each fragment is just a widget which we pass the navigate function

    //will pop scope catches the back button presses
    return WillPopScope(
      onWillPop: () {
        return customPop(context);
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            RaisedButton(
              child:Text('PRESS'),
              onPressed: (){
                _currentIndex++;
                navigateTo(_currentIndex);
              },
            ),
            Expanded(
              child: _fragments[_currentIndex],
            ),
          ],
        ),
      ),
    );
  }


  void navigateTo(int index) {
    _backstack.add(index);
    setState(() {
      _currentIndex = index;
    });

    _setTitle('$index');
  }

  void navigateBack(int index) {
    setState(() {
      _currentIndex = index;
    });

    _setTitle('$index');
  }

  Future<bool> customPop(BuildContext context) {
    print("CustomPop is called");
    print("_backstack = $_backstack");
    if (_backstack.length   > 1) {
      _backstack.removeAt(_backstack.length - 1);
      navigateBack(_backstack[_backstack.length - 1]);

      return Future.value(false);
    } else {

      return Future.value(true);
    }
  }
  //this method could be called by the navigate and navigate back methods
  _setTitle(String appBarTitle) {
    setState(() {
      title = appBarTitle;
    });
  }
}

class Fragment2 extends StatefulWidget {
  @override
  State<Fragment2> createState() => _Fragment2();
}

class _Fragment2 extends State<Fragment2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("_Fragment2"),
          onPressed: (){
          }),
    );
  }
}


class Fragment1 extends StatefulWidget {
  @override
  State<Fragment1> createState() => _Fragment1();
}

class _Fragment1 extends State<Fragment1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("_Fragment1"),
    );
  }
}


class Fragment3 extends StatefulWidget {
  @override
  State<Fragment3> createState() => _Fragment3();
}

class _Fragment3 extends State<Fragment3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("_Fragment3"),
    );
  }
}