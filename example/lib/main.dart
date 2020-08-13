import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

import 'spinning_wheel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Radar Chart Example"),
          ),
          body: SpinningWheelScreen()

//        Container(
//          child: Center(child:
//            PieChart(
//              values: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10],
//              labels: [
//                "Label1",
//                "Label2",
//                "Label3",
//                "Label4",
//                "Label5",
//                "Label6",
//                "Label7",
//                "Label8",
//                "Label9",
//                "Label10",
//              ],
//              sliceFillColors: [
//                Colors.blueAccent,
//                Colors.greenAccent,
//                Colors.pink,
//                Colors.orange,
//                Colors.red,
//                Colors.blueAccent,
//                Colors.greenAccent,
//                Colors.pink,
//                Colors.orange,
//                Colors.red,
//              ],
//              animationDuration: Duration(milliseconds: 1500),
//              showLegend: false,
//            ),
//         ),
//        ),
          ),
    );
  }
}
