import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:wallet_provider/provider/expenses_p.dart';

class Header extends StatefulWidget {
 const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  void showMonthDialog(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: Provider.of<Expenses>(context).selectedDate,
      firstDate: DateTime(2021, 1),
      lastDate: DateTime(DateTime.now().year + 1, 12),
    ).then((date) {
      if (date != null) {
        setState(() {
          Provider.of<Expenses>(context).changeSelectedDate(date);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<Expenses>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () => showMonthDialog(context),
              child: Text(
                DateFormat('MMMM, y').format(expenses.selectedDate),
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    expenses.previousMonth();
                  },
                  icon: const Icon(
                    Icons.arrow_left_outlined,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                          expenses.totalMonthlyAmount().toStringAsFixed(0),
                          style:const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                  const Text(
                    'so\'m',
                    style: TextStyle(
                        fontSize: 20, height: 0.6, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    expenses.nextMonth();
                  },
                  icon: const Icon(
                    Icons.arrow_right_outlined,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
