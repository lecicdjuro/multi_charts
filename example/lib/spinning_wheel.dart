import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

import 'package:multi_charts/multi_charts.dart';

class SpinningWheelScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SpinningWheelScreeState();
  }
}

class _SpinningWheelScreeState extends State<SpinningWheelScreen> {
  StreamController<int> _dividerController;
  StreamController<int> _updateController;

  StreamController<double> _wheelNotifier;

  int initCounter = 0;
  final Map<int, String> labels = <int, String>{
    1: '10',
    2: '20',
    3: '30',
    4: 'Oops!',
    5: '40',
    6: '50',
    7: '60',
    8: '70',
    9: 'Oops!',
    10: '80',
    11: '90',
    12: '100'
  };

  @override
  void dispose() {
    _dividerController.close();
    _updateController.close();
    _wheelNotifier.close();
    super.dispose();
  }

  @override
  void initState() {
    _dividerController = StreamController<int>();
    _updateController = StreamController<int>();
    _wheelNotifier = StreamController<double>();
    super.initState();

    _dividerController.stream.listen((int event) {
//      showInfoDialog(context, event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          Text('Try your luck',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 8),
          Container(
              width: 180,
              child: Text('Spin the wheel and win points every day!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1)),
          SizedBox(height: 40),
          IgnorePointer(
              child: SpinningWheel(
            PieChart(
              values: <double>[10, 10, 10, 10, 10, 10, 10, 10, 10, 10],
              labels: <String>[
                "Label1",
                "Label2",
                "Label3",
                "Label4",
                "Label5",
                "Label6",
                "Label7",
                "Label8",
                "Label9",
                "Label10",
              ],
//              separateFocusedValue: true,
//              separatedValueType: SeparatedValue.Max,
              sliceFillColors: [
                Colors.blueAccent,
                Colors.greenAccent,
                Colors.pink,
                Colors.orange,
                Colors.blueAccent,
                Colors.greenAccent,
                Colors.pink,
                Colors.orange,
                Colors.blueAccent,
                Colors.greenAccent,
              ],
              animationDuration: Duration(milliseconds: 0),
              showLegend: false,
            ),
            width: 310,
            height: 310,
            initialSpinAngle: 0.3,
            spinResistance: 0.7,
            canInteractWhileSpinning: false,
            dividers: 10,
            onUpdate: _updateController.add,
            onEnd: _dividerController.add,
//                    secondaryImage: SvgPicture.asset(
//                      wheelCenterImage,
//                      color: iconPrimary,
//                    ),
            secondaryImageHeight: 78,
            secondaryImageWidth: 47,
            shouldStartOrStop: _wheelNotifier.stream,
          )),
          SizedBox(height: 30),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RaisedButton(child: Text('pin the wheel'), onPressed:() =>
                _wheelNotifier.sink.add(_generateRandomVelocity()) ,)

//            FooterButton(
//                type: ButtonType.RAISED,
//                buttonColor: iconPrimary,
//                text: 'spin the wheel',
//                onButtonPressed: () =>
//                    _wheelNotifier.sink.add(_generateRandomVelocity())),
          )
        ]))));
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 10000) + 4050;

//  void showInfoDialog(BuildContext context, int event) {
//    String text;
//    String title;
//    if (event == 4 || event == 9) {
//      text =
//          'Sorry, you haven’t won any points this time. Try your luck again tomorrow!';
//      title = labels[event];
//    } else if (event == 12) {
//      title = 'Congrats';
//      text = 'You’ve won a jackpot worth ${labels[event]} points! Well done!';
//    } else {
//      title = 'Congrats';
//      text = 'You’ve just won ${labels[event]} Points!';
//    }
//    showDialog<dynamic>(
//      context: context,
//      barrierDismissible: false,
//      builder: (BuildContext context) {
//        return ConfirmationDialog(
//          text,
//          () {},
//          title: title,
//          positiveButtonText: LocalizationResources.of(context).ok,
//          onCancelPressed: () {
//            Navigator.maybePop(context);
//          },
//        );
//      },
//    ).then((dynamic result) {
//      print(result);
//    });
//  }
}
