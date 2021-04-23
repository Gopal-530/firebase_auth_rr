import 'package:firebase_auth_rr/catalog.dart';
import 'package:firebase_auth_rr/deliveries.dart';
import 'package:firebase_auth_rr/fragment_catalog.dart';
import 'package:firebase_auth_rr/invoices.dart';
import 'package:firebase_auth_rr/purchase.dart';
import 'package:firebase_auth_rr/Payment_status.dart';
import 'package:firebase_auth_rr/exceldata.dart';
import 'package:firebase_auth_rr/Payment_status.dart';
import 'package:firebase_auth_rr/barchart.dart';
import 'package:firebase_auth_rr/testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:universal_io/io.dart';


/*
void main(List<String> args) {
  var file = "/C:/Users/91971/Downloads/excel.xlsx";
  var bytes = File(file).readAsBytesSync();
  var excel = Excel.createExcel();
  // or
  //var excel = Excel.decodeBytes(bytes);
  for (var table in excel.tables.keys) {
    print(table);
    print(excel.tables[table].maxCols);
    print(excel.tables[table].maxRows);
    for (var row in excel.tables[table].rows) {
      print("$row");
    }
  }

  CellStyle cellStyle = CellStyle(
    bold: true,
    italic: true,
    fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
  );

  var sheet = excel['mySheet'];

  var cell = sheet.cell(CellIndex.indexByString("A1"));
  cell.value = "Heya How are you I am fine ok goood night";
  cell.cellStyle = cellStyle;

  var cell2 = sheet.cell(CellIndex.indexByString("E5"));
  cell2.value = "Heya How night";
  cell2.cellStyle = cellStyle;

  /// printing cell-type
  print("CellType: " + cell.cellType.toString());

  /// Iterating and changing values to desired type
  for (int row = 0; row < sheet.maxRows; row++) {
    sheet.row(row).forEach((cell) {
      var val = cell.value; //  Value stored in the particular cell

      cell.value = ' My custom Value ';
    });
  }

  excel.rename("mySheet", "myRenamedNewSheet");

  // fromSheet should exist in order to sucessfully copy the contents
  excel.copy('myRenamedNewSheet', 'toSheet');

  excel.rename('oldSheetName', 'newSheetName');

  excel.delete('Sheet1');

  excel.unLink('sheet1');

  sheet = excel['sheet'];

  /// appending rows
  List<List<String>> list = List.generate(
      6000, (index) => List.generate(20, (index1) => '$index $index1'));

  Stopwatch stopwatch = new Stopwatch()..start();
  list.forEach((row) {
    sheet.appendRow(row);
  });

  print('doSomething() executed in ${stopwatch.elapsed}');

  sheet.appendRow([8]);
  excel.setDefaultSheet(sheet.sheetName).then((isSet) {
    // isSet is bool which tells that whether the setting of default sheet is successful or not.
    if (isSet) {
      print("${sheet.sheetName} is set to default sheet.");
    } else {
      print("Unable to set ${sheet.sheetName} to default sheet.");
    }
  });

  // Saving the file

  String outputFile = "/C:/Users/91971/Downloads/excel.xlsx";
  excel.encode().then((onValue) {
    File(join(outputFile))
      ..createSync(recursive: true)
      ..writeAsBytesSync(onValue);
  });
}
*/


/*
void main(List<String> args) {
  var file = 'C:/Users/91971/Documents/Downloads/Domains.xlsx';
  var bytes = File(file).readAsBytesSync();
  var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);
  for (var table in decoder.tables.keys) {
    print(table);
    print(decoder.tables[table].maxCols);
    print(decoder.tables[table].maxRows);
    for (var row in decoder.tables[table].rows) {
      print('$row');
    }
  }

  var sheet = decoder.tables.keys.first;
  decoder
    ..updateCell(sheet, 0, 0, "L'oiseau <\"coucou\">")
    ..updateCell(sheet, 1, 0, 'B')
    ..updateCell(sheet, 2, 0, 'C')
    ..updateCell(sheet, 1, 1, 42.3)
    ..insertRow(sheet, 1)
    ..insertRow(sheet, 13)
    ..updateCell(sheet, 0, 13, 'A14')
    ..updateCell(sheet, 0, 12, 'A13')
    ..insertColumn(sheet, 0)
    ..removeRow(sheet, 1)
    ..removeColumn(sheet, 2);

  File(join('test/out/${basename(file)}'))
    ..createSync(recursive: true)
    ..writeAsBytesSync(decoder.encode());

  print('************************************************************');
  for (var table in decoder.tables.keys) {
    print(table);
    print(decoder.tables[table].maxCols);
    print(decoder.tables[table].maxRows);
    for (var row in decoder.tables[table].rows) {
      print('$row');
    }
  }
}
*/

/*

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Widget> playButtonList;

  void initState() {
    playButtonList = <Widget>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Aid'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('Add Play Button'),
            color: Colors.black26,
            onPressed: () {
              setState(() {
                playButtonList.add(PlayButton());
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: playButtonList.length,
              itemBuilder: (context, index) => playButtonList[index],
            ),
          )
        ],
      ),
    );
  }
}

class PlayButton extends StatefulWidget {
  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  IconData icon;

  @override
  void initState() {
    icon = Icons.play_arrow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Icon(icon),
        onPressed: () {
          setState(() {
            if (icon == Icons.play_arrow)
              icon = Icons.pause;
            else
              icon = Icons.play_arrow;
          });
        },
      ),
    );
  }
}
*/



void main() {
  runApp(FavoriteWidget());
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal[900], //Changing this will change the color of the TabBar
    //    accentColor: Colors.cyan[600],
      ),
      home: Scaffold(
        body: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0), // here the desired height
              child: AppBar(
              bottom: TabBar(
                indicatorColor: Colors.white,

                labelStyle: TextStyle(fontSize: 16.0,fontFamily: 'Family Name'),  //For Selected tab
                unselectedLabelStyle: TextStyle(fontSize: 14.0,fontFamily: 'Family Name'), //For Un-selected Tabs

                tabs: [
                  Tab(text: "Dashboard"),
                  Tab(text: "Catalog"),
                  Tab(text: "Order Status"),
                  Tab(text: "Deliveries"),
                  Tab(text: "Payment Status"),
                  Tab(text: "Report"),

                ],
              ),
              ),
            ),
            body: TabBarView(

              children: [
                ChartsDemo(),
                SingleChildScrollView(
                    child: Catalog()
                ),
                Container(
                  child: purchase(),
                ),
                Container(
                  child: deliveries(),
                ),
                Container(
                  child: payment(),
                ),
                //Icon(Icons.directions_bike),
                ExpensesReportXlsIO()

              ],
            ),
          ),
        ),

      ),

    );
  }
}



/*
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

void main(List<String> args) {
  var file = "/Users/kawal/Desktop/form.xlsx";
  var bytes = File(file).readAsBytesSync();
  var excel = Excel.createExcel();
  // or
  //var excel = Excel.decodeBytes(bytes);
  for (var table in excel.tables.keys) {
    print(table);
    print(excel.tables[table].maxCols);
    print(excel.tables[table].maxRows);
    for (var row in excel.tables[table].rows) {
      print("$row");
    }
  }

  CellStyle cellStyle = CellStyle(
    bold: true,
    italic: true,
    fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
  );

  var sheet = excel['mySheet'];

  var cell = sheet.cell(CellIndex.indexByString("A1"));
  cell.value = "Heya How are you I am fine ok goood night";
  cell.cellStyle = cellStyle;

  var cell2 = sheet.cell(CellIndex.indexByString("E5"));
  cell2.value = "Heya How night";
  cell2.cellStyle = cellStyle;

  /// printing cell-type
  print("CellType: " + cell.cellType.toString());

  /// Iterating and changing values to desired type
  for (int row = 0; row < sheet.maxRows; row++) {
    sheet.row(row).forEach((cell) {
      var val = cell.value; //  Value stored in the particular cell

      cell.value = ' My custom Value ';
    });
  }

  excel.rename("mySheet", "myRenamedNewSheet");

  // fromSheet should exist in order to sucessfully copy the contents
  excel.copy('myRenamedNewSheet', 'toSheet');

  excel.rename('oldSheetName', 'newSheetName');

  excel.delete('Sheet1');

  excel.unLink('sheet1');

  sheet = excel['sheet'];

  /// appending rows
  List<List<String>> list = List.generate(
      6000, (index) => List.generate(20, (index1) => '$index $index1'));

  Stopwatch stopwatch = new Stopwatch()..start();
  list.forEach((row) {
    sheet.appendRow(row);
  });

  print('doSomething() executed in ${stopwatch.elapsed}');

  sheet.appendRow([8]);
  excel.setDefaultSheet(sheet.sheetName).then((isSet) {
    // isSet is bool which tells that whether the setting of default sheet is successful or not.
    if (isSet) {
      print("${sheet.sheetName} is set to default sheet.");
    } else {
      print("Unable to set ${sheet.sheetName} to default sheet.");
    }
  });

  // Saving the file

  String outputFile = "/Users/kawal/Desktop/form1.xlsx";
  excel.encode().then((onValue) {
    File(join(outputFile))
      ..createSync(recursive: true)
      ..writeAsBytesSync(onValue);
  });
}
*/

//------link for creating excel through flutter--**---https://www.syncfusion.com/blogs/post/introducing-excel-library-for-flutter.aspx---------/