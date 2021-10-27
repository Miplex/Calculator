import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:provider/provider.dart';
import 'package:calculator/models/calculator.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Opacity(
                    opacity: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        (context).watch<Calculator>().getPrevNumber,
                        style: const TextStyle(
                            fontSize: 37.2,
                            color: kButtonColor,
                            fontFamily: 'RobotoThin'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                        ((context).watch<Calculator>().getCurrentNumber),
                        style: const TextStyle(
                            fontSize: 53.2,
                            color: kButtonColor,
                            fontFamily: 'RobotoThin')),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const NumPad(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NumPad extends StatelessWidget {
  const NumPad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridButton(
      borderWidth: 0.5,
      borderColor: kBorderColor,
      onPressed: (value) {
        if (value == 'DEL') {
          (context).read<Calculator>().delete();
        } else if (value == 'AC') {
          (context).read<Calculator>().clear();
        } else {
          (context).read<Calculator>().updateDisplay(value);
        }
      },
      items: const [
        [
          GridButtonItem(
              title: 'AC',
              value: 'AC',
              textStyle: TextStyle(
                  color: kButtonColor,
                  fontSize: 24.0,
                  fontFamily: 'RobotoLight'),
              flex: 2),
          GridButtonItem(
            title: 'DEL',
            value: 'DEL',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '/',
            value: '/',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
        ],
        [
          GridButtonItem(
            title: '1',
            value: '1',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '2',
            value: '2',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '3',
            value: '3',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '*',
            value: '*',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
        ],
        [
          GridButtonItem(
            title: '4',
            value: '4',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '5',
            value: '5',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '6',
            value: '6',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '+',
            value: '+',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
        ],
        [
          GridButtonItem(
            title: '7',
            value: '7',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '8',
            value: '8',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '9',
            value: '9',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '-',
            value: '-',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
        ],
        [
          GridButtonItem(
            title: '.',
            value: '.',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
            title: '0',
            value: '0',
            textStyle: TextStyle(
                color: kButtonColor, fontSize: 24.0, fontFamily: 'RobotoLight'),
          ),
          GridButtonItem(
              title: '=',
              value: '=',
              textStyle: TextStyle(
                  color: kButtonColor,
                  fontSize: 24.0,
                  fontFamily: 'RobotoLight'),
              flex: 2),
        ]
      ],
    );
  }
}
