import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_provider/model/expense.dart';
import 'package:wallet_provider/provider/expenses_p.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;
  final Key key;

  const ExpenseListItem({
    required this.expense,
    required this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<Expenses>(context, listen: false);
    return Dismissible(
      key: key,
      onDismissed: (direction) {
        expenses.removeExpense(expense.id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 15),
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Icon(expense.icon),
        title: Text(
          expense.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat('dd.mm.yyyy hh:mm').format(expense.date)),
        trailing: Text('${expense.amount.toStringAsFixed(0)} so\'m'),
      ),
    );
  }
}
