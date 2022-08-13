// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;
  
  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
  });

}
