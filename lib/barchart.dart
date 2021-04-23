
import 'package:flutter/material.dart' ;
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment,Row;
import 'package:syncfusion_officechart/officechart.dart';
import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' ;

class ChartsDemo extends StatefulWidget{

  ChartsDemoState createState()=> ChartsDemoState();

}

class ChartsDemoState extends State<ChartsDemo> {


    List<charts.Series> seriesList;
    List<charts.Series> deliveryreport;




    final List<PopulationData> data = [
      PopulationData(
          month: "Jan",
          population: 50189209,
          barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
      ),
      PopulationData(
          month: "Feb",
          population: 62979766,
          barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
      ),
      PopulationData(
          month: "March",
          population: 76212168,
          barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
      ),
      PopulationData(
          month: "April",
          population: 92228496,
          barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
      ),
      PopulationData(
          month: "May",
          population: 106021537,
          barColor: charts.ColorUtil.fromDartColor(Colors.blue)
      ),
      PopulationData(
          month: "June",
          population: 123202624,
          barColor: charts.ColorUtil.fromDartColor(Colors.blue)
      ),
      PopulationData(
          month: "July",
          population: 132164569,
          barColor: charts.ColorUtil.fromDartColor(Colors.blue)
      ),
      PopulationData(
          month: "Aug",
          population: 151325798,
          barColor: charts.ColorUtil.fromDartColor(Colors.blue)
      ),
      PopulationData(
          month: "Sep",
          population: 179323175,
          barColor: charts.ColorUtil.fromDartColor(Colors.blue)
      ),
      PopulationData(
          month: "Oct",
          population: 203302031,
          barColor: charts.ColorUtil.fromDartColor(Colors.purple)
      ),
      PopulationData(
          month: "Nov",
          population: 226542199,
          barColor: charts.ColorUtil.fromDartColor(Colors.purple)
      ),
      PopulationData(
          month: "Dec",
          population: 248709873,
          barColor: charts.ColorUtil.fromDartColor(Colors.purple)
      ),

    ];

    final List<PopulationData> data1 = [
      PopulationData(
          month: "Open Delivery",
          population: 20,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)
      ),
      PopulationData(
          month: "Closed delivery",
          population: 62,
          barColor: charts.ColorUtil.fromDartColor(Colors.red)
      ),

    ];



    _getSeriesData() {
      List<charts.Series<PopulationData, String>> series = [
        charts.Series(
            id: "Population",
            data: data,
            domainFn: (PopulationData series, _) => series.month.toString(),
            measureFn: (PopulationData series, _) => series.population,
            colorFn: (PopulationData series, _) => series.barColor
        )
      ];
      return series;
    }

    _getpieData() {
      List<charts.Series<PopulationData, String>> series = [
        charts.Series(
            id: "Population",
            data: data1,
           domainFn: (PopulationData series, _) => series.month.toString(),
            measureFn: (PopulationData series, _) => series.population,
            colorFn: (PopulationData series, _) => series.barColor
        )
      ];
      return series;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              //  margin:EdgeInsets.only(top: 20),
              children: [

                Row(
                  children: [
                    Expanded(

                      child: GestureDetector(
                        child: Container(
                          height: 400,
                          padding: EdgeInsets.all(20),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Sales Report of Year 2021",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Expanded(
                                    child: charts.BarChart(
                                      _getSeriesData(),
                                      animate: true,
                                      domainAxis: charts.OrdinalAxisSpec(
                                          renderSpec: charts.SmallTickRendererSpec()
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: (){

                        },
                      )


                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: 400,

                          padding: EdgeInsets.all(20),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Delivery Report",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Expanded(
                                    child:/* SfCircularChart(
                                    series: _getpieData(),
                                  ),*/


                                    charts.PieChart(
                                        _getpieData(),
                                        animate: true,
                                        animationDuration: Duration(seconds: 5),

                                        behaviors: [
                                          new charts.DatumLegend(
                                            outsideJustification: charts.OutsideJustification.endDrawArea,
                                            horizontalFirst: false,


                                            desiredMaxRows: 2,
                                            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                            entryTextStyle: charts.TextStyleSpec(

                                                color: charts.MaterialPalette.purple.shadeDefault,
                                                fontFamily: 'Georgia',

                                                fontSize: 11),
                                          ),


                                        ],
                                        defaultRenderer: new charts.ArcRendererConfig(
                                            arcWidth: 100,
                                            arcRendererDecorators: [
                                              new charts.ArcLabelDecorator(
                                                  labelPosition: charts.ArcLabelPosition.inside)
                                            ])),
                                  ),
                                 /* Container(
                                    width: 80.0,
                                    height: 30.0,
                                    child: RaisedButton(
                                      color: Color(0XFFFF0000),
                                      child: Row(
                                        children: <Widget>[
                                          Text('Download', style: TextStyle(color: Colors.white),),

                                        ],
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          _generateExcel;
                        },
                      )
                    )
                  ],
                ),
               /*  Row(
                children: [
                  Expanded(

                    child: Container(
                      height: 400,
                      padding: EdgeInsets.all(20),

                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Invoice Outstanding ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: charts.BarChart(
                                  _getSeriesData(),
                                  animate: true,
                                  domainAxis: charts.OrdinalAxisSpec(
                                      renderSpec: charts.SmallTickRendererSpec()
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),


                  ),
                  Expanded(
                    child: Container(
                      height: 400,

                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Vendor Outstanding",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: charts.BarChart(
                                  _getSeriesData(),
                                  animate: true,
                                  domainAxis: charts.OrdinalAxisSpec(
                                      renderSpec: charts.SmallTickRendererSpec()
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )*/

              ],
            ),
          )
        ),
      );

    }
    Future<void> _generateExcel() async {
      //Create a Excel document.

      //Creating a workbook.
      final Workbook workbook = Workbook(0);
      //Adding a Sheet with name to workbook.
      final Worksheet sheet1 = workbook.worksheets.addWithName('Budget');
      sheet1.showGridlines = false;

      sheet1.enableSheetCalculations();
      sheet1.getRangeByIndex(1, 1).columnWidth = 19.86;
      sheet1.getRangeByIndex(1, 2).columnWidth = 14.38;
      sheet1.getRangeByIndex(1, 3).columnWidth = 12.98;
      sheet1.getRangeByIndex(1, 4).columnWidth = 12.08;
      sheet1.getRangeByIndex(1, 5).columnWidth = 8.82;
      sheet1.getRangeByName('A1:A18').rowHeight = 20.2;

      //Adding cell style.
      final Style style1 = workbook.styles.add('Style1');
      style1.backColor = '#D9E1F2';
      style1.hAlign = HAlignType.left;
      style1.vAlign = VAlignType.center;
      style1.bold = true;

      final Style style2 = workbook.styles.add('Style2');
      style2.backColor = '#8EA9DB';
      style2.vAlign = VAlignType.center;
      style2.numberFormat = '[Red](\$#,###)';
      style2.bold = true;

      sheet1.getRangeByName('A10').cellStyle = style1;
      sheet1.getRangeByName('B10:D10').cellStyle.backColor = '#D9E1F2';
      sheet1.getRangeByName('B10:D10').cellStyle.hAlign = HAlignType.right;
      sheet1.getRangeByName('B10:D10').cellStyle.vAlign = VAlignType.center;
      sheet1.getRangeByName('B10:D10').cellStyle.bold = true;

      sheet1.getRangeByName('A11:A17').cellStyle.vAlign = VAlignType.center;
      sheet1.getRangeByName('A11:D17').cellStyle.borders.bottom.lineStyle =
          LineStyle.thin;
      sheet1.getRangeByName('A11:D17').cellStyle.borders.bottom.color = '#BFBFBF';

      sheet1.getRangeByName('D18').cellStyle = style2;
      sheet1.getRangeByName('D18').cellStyle.vAlign = VAlignType.center;
      sheet1.getRangeByName('A18:C18').cellStyle.backColor = '#8EA9DB';
      sheet1.getRangeByName('A18:C18').cellStyle.vAlign = VAlignType.center;
      sheet1.getRangeByName('A18:C18').cellStyle.bold = true;
      sheet1.getRangeByName('A18:C18').numberFormat = '\$#,###';

      sheet1.getRangeByIndex(10, 1).text = 'Category';
      sheet1.getRangeByIndex(10, 2).text = 'Expected cost';
      sheet1.getRangeByIndex(10, 3).text = 'Actual Cost';
      sheet1.getRangeByIndex(10, 4).text = 'Difference';
      sheet1.getRangeByIndex(11, 1).text = 'Venue';
      sheet1.getRangeByIndex(12, 1).text = 'Seating & Decor';
      sheet1.getRangeByIndex(13, 1).text = 'Technical team';
      sheet1.getRangeByIndex(14, 1).text = 'Performers';
      sheet1.getRangeByIndex(15, 1).text = 'Performer\'s transport';
      sheet1.getRangeByIndex(16, 1).text = 'Performer\'s stay';
      sheet1.getRangeByIndex(17, 1).text = 'Marketing';
      sheet1.getRangeByIndex(18, 1).text = 'Total';

      sheet1.getRangeByName('B11:D17').numberFormat = '\$#,###';
      sheet1.getRangeByName('D11').numberFormat = '[Red](\$#,###)';
      sheet1.getRangeByName('D12').numberFormat = '[Red](\$#,###)';
      sheet1.getRangeByName('D14').numberFormat = '[Red](\$#,###)';

      sheet1.getRangeByName('B11').number = 16250;
      sheet1.getRangeByName('B12').number = 1600;
      sheet1.getRangeByName('B13').number = 1000;
      sheet1.getRangeByName('B14').number = 12400;
      sheet1.getRangeByName('B15').number = 3000;
      sheet1.getRangeByName('B16').number = 4500;
      sheet1.getRangeByName('B17').number = 3000;
      sheet1.getRangeByName('B18').formula = '=SUM(B11:B17)';

      sheet1.getRangeByName('C11').number = 17500;
      sheet1.getRangeByName('C12').number = 1828;
      sheet1.getRangeByName('C13').number = 800;
      sheet1.getRangeByName('C14').number = 14000;
      sheet1.getRangeByName('C15').number = 2600;
      sheet1.getRangeByName('C16').number = 4464;
      sheet1.getRangeByName('C17').number = 2700;
      sheet1.getRangeByName('C18').formula = '=SUM(C11:C17)';

      sheet1.getRangeByName('D11').formula = '=IF(C11>B11,C11-B11,B11-C11)';
      sheet1.getRangeByName('D12').formula = '=IF(C12>B12,C12-B12,B12-C12)';
      sheet1.getRangeByName('D13').formula = '=IF(C13>B13,C13-B13,B13-C13)';
      sheet1.getRangeByName('D14').formula = '=IF(C14>B14,C14-B14,B14-C14)';
      sheet1.getRangeByName('D15').formula = '=IF(C15>B15,C15-B15,B15-C15)';
      sheet1.getRangeByName('D16').formula = '=IF(C16>B16,C16-B16,B16-C16)';
      sheet1.getRangeByName('D17').formula = '=IF(C17>B17,C17-B17,B17-C17)';
      sheet1.getRangeByName('D18').formula = '=IF(C18>B18,C18-B18,B18-C18)';

      final ChartCollection charts = ChartCollection(sheet1);
      final Chart chart = charts.add();
      chart.chartType = ExcelChartType.pie;
      chart.dataRange = sheet1.getRangeByName('A11:B17');
      chart.isSeriesInRows = false;
      chart.chartTitle = 'Event Expenses';
      chart.chartTitleArea.bold = true;
      chart.chartTitleArea.size = 16;
      chart.topRow = 1;
      chart.bottomRow = 10;
      chart.leftColumn = 1;
      chart.rightColumn = 5;
      sheet1.charts = charts;

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      //Launch file.
      await FileSaveHelper.saveAndLaunchFile(bytes, 'ExpensesReport.xlsx');
    }
}


class PopulationData {
  String month;
  int population;
  charts.Color barColor;
  PopulationData({
    @required this.month,
    @required this.population,
    @required this.barColor
  });
}
/*
class ChartsDemo extends StatefulWidget {
  //
  ChartsDemo() : super();

  final String title = "Charts Demo";

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  //
  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [

      Sales('2017', 68),
    ];

    final tabletSalesData = [

      Sales('2016', 77),

    ];

    final mobileSalesData = [
      Sales('2015', 89),

    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: tabletSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.green.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: mobileSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.teal.shadeDefault;
        },
      )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}
*/
class FileSaveHelper {
  ///To save the Excel file in the device
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', fileName)
      ..click();
  }
}