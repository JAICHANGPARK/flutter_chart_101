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
          data: data,
          labelAccessorFn: (Sales sales, _) =>
              '${sales.day} : ${sales.sold.toString()}'),
    ];

    var chart = charts.BarChart(
      series,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
    var pi_chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [charts.ArcLabelDecorator()],
        arcWidth: 100
      ),
      animate: true,
      animationDuration: Duration(seconds: 1),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Pie chart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: pi_chart,
      ),
    );
  }
}
