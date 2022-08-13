import 'package:flutter/material.dart';
import 'package:wallet_provider/provider/expenses_p.dart';
import 'package:wallet_provider/widgets/expense_list_item.dart';

class ExpenseList extends StatelessWidget {
  final Expenses expenses;
  const ExpenseList(this.expenses, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 345,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        ),
        child:  ListView.builder(
                itemCount:expenses.getExpensesByMonth().length,
                itemBuilder: (ctx, i) {
                  final expense = expenses.getExpensesByMonth()[i];
                  return  ExpenseListItem(expense: expense, key: ValueKey(expense.id), );
          },
        ),
      ),
    );
  }
}


