import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:provider/provider.dart';
import 'package:calculator/models/calculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
            colors: [
              kLinearColorBegin,
              kLinearColorEnd,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Opacity(
                  opacity: (context).watch<Calculator>().getOpacity,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      (context).watch<Calculator>().getPrevNumber,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: kButtonColor.withOpacity(0.6),
                          fontFamily: 'LatoLight'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                        fontSize: (context).watch<Calculator>().getFontsize,
                        color: kButtonColor,
                        fontFamily: 'LatoRegular'),
                    child: Text(
                      ((context).watch<Calculator>().getCurrentNumber),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const NumPad(),
              ),
            ),
          ],
        ),
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
      borderColor: ktransparent,
      borderWidth: 0.0,
      onPressed: (value) {
        if (value == 'DEL') {
          (context).read<Calculator>().delete();
        } else if (value == 'AC') {
          (context).read<Calculator>().clear();
        } else if (value == '=') {
          (context).read<Calculator>().compute();
          (context).read<Calculator>().updateDisplay(value);
        } else {
          (context).read<Calculator>().updateDisplay(value);
        }
      },
      items: const [
        [
          GridButtonItem(
              title: 'AC',
              value: 'AC',
              color: kOperationColor,
              textStyle: TextStyle(
                  color: kBackgroundAC,
                  fontSize: 24.0,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w600),
              flex: 2),
          GridButtonItem(
            value: 'DEL',
            color: kOperationColor,
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
            child: FaIcon(FontAwesomeIcons.backspace),
          ),
          GridButtonItem(
            value: '÷',
            color: kOperationColor,
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
            child: FaIcon(FontAwesomeIcons.divide),
          ),
        ],
        [
          GridButtonItem(
            title: '1',
            value: '1',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            title: '2',
            value: '2',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            title: '3',
            value: '3',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            value: '*',
            color: kOperationColor,
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
            child: FaIcon(FontAwesomeIcons.times),
          ),
        ],
        [
          GridButtonItem(
            title: '4',
            value: '4',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            title: '5',
            value: '5',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            title: '6',
            value: '6',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            value: '+',
            color: kOperationColor,
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
            child: FaIcon(FontAwesomeIcons.plus),
          ),
        ],
        [
          GridButtonItem(
            title: '7',
            value: '7',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            title: '8',
            value: '8',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            title: '9',
            value: '9',
            textStyle: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w600),
          ),
          GridButtonItem(
            value: '-',
            color: kOperationColor,
            textStyle:
                TextStyle(color: kButtonColor, fontFamily: 'HelveticaNeueCyr'),
            child: FaIcon(FontAwesomeIcons.minus),
          ),
        ],
        [
          GridButtonItem(
              title: '0',
              value: '0',
              textStyle: TextStyle(
                  color: kButtonColor,
                  fontSize: 24.0,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w600)),
          GridButtonItem(
              title: '.',
              value: '.',
              textStyle: TextStyle(
                  color: kButtonColor,
                  fontSize: 34.0,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w600),
              flex: 2),
          GridButtonItem(
              value: '=',
              color: kEqualsColor,
              textStyle: TextStyle(
                  color: kButtonColor,
                  fontSize: 20.0,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w600),
              child: FaIcon(FontAwesomeIcons.equals)),
        ]
      ],
    );
  }
}
