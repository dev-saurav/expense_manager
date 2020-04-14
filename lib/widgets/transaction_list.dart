import 'package:expanse_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class TrasactionList extends StatelessWidget {
  final List<Transaction> _userTrasactions;
  TrasactionList(this._userTrasactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Text(
                    'Rs ${_userTrasactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _userTrasactions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      DateFormat.yMMMd().format(_userTrasactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _userTrasactions.length,
      ),
    );
  }
}
