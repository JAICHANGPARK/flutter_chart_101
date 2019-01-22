import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Sales {
  final String day;
  final int sold;

  Sales(this.day, this.sold);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    var data = [
      Sales("Sun", 50),
      Sales("Mon", 70),
      Sales("Tue", 100),
      Sales("Wed", 50),
      Sales("Thu", 145),
      Sales("Fri", 190),
      Sales("Sat", 30),
    ];

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          id: 'Sales',
          data: data)
    ];

    var chart = charts.BarChart(
      series
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Bar chart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: chart,
      ),
    );
  }
}
