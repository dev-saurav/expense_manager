import 'package:expanse_manager/widgets/ChartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "../models/transaction.dart";

class Chart extends StatelessWidget {
  final transactionList;
  Chart({this.transactionList});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (Transaction tx in transactionList) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactions.map((tx) {
            return ChartBar(
                weekDay: tx["day"],
                amount: tx["amount"],
                perBarFilled: totalSpending == 0.0
                    ? 0.0
                    : (tx["amount"] as double) / totalSpending);
          }).toList(),
        ));
  }
}
