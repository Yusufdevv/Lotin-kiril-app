import 'package:flutter/material.dart';
import 'package:wallet_provider/model/expense.dart';

class Expenses with ChangeNotifier {
  final List<Expense> _list = [
    Expense(
        id: UniqueKey().toString(),
        title: 'Remon telefon',
        date: DateTime.now(),
        amount: 400000,
        icon: Icons.ac_unit),
    Expense(
        id: UniqueKey().toString(),
        title: 'Ventilyator',
        date: DateTime.now(),
        amount: 180000,
        icon: Icons.ac_unit),
    Expense(
        id: UniqueKey().toString(),
        title: 'Book',
        date: DateTime.now(),
        amount: 40000,
        icon: Icons.ac_unit),
    Expense(
        id: UniqueKey().toString(),
        title: 'Book',
        date: DateTime(2022, 6),
        amount: 40000,
        icon: Icons.ac_unit),
    Expense(
        id: UniqueKey().toString(),
        title: 'Restoran',
        date: DateTime(2022, 6),
        amount: 200000,
        icon: Icons.ac_unit),
  ];

  DateTime selectedDate = DateTime.now();

  void changeSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  List<Expense> getExpensesByMonth() {
    return _list
        .where((expense) =>
            expense.date.year == selectedDate.year &&
            expense.date.month == selectedDate.month)
        .toList();
  }

   double totalMonthlyAmount() {
    final expenses = getExpensesByMonth();
    return expenses.fold(0, (previousValue, expense) {
      return previousValue + expense.amount;
    });
  }


  void removeExpense(String id) {
    _list.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }

  void addNewExpense(String id, String title, DateTime date, double amount,) {
    _list.insert(0, Expense(id: id, title: title, date: date, amount: amount, icon: Icons.ac_unit));
    notifyListeners();
  }


  void previousMonth() {
    if (selectedDate.year == 2021 && selectedDate.month == 1) {
      return;
    }
    selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
    notifyListeners();
  }

  void nextMonth() {
    if (selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month) {
      return;
    }
    selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
    notifyListeners();
  }

 
}
