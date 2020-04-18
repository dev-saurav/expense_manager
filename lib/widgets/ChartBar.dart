import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekDay;
  final double amount;
  final double perBarFilled;

  ChartBar({this.weekDay, this.amount, this.perBarFilled});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('₹ $amount'),
        SizedBox(
          height: 2,
        ),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: perBarFilled,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 2,
        ),
        Text(weekDay),
      ],
    );
  }
}
