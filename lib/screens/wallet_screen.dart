import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_provider/provider/expenses_p.dart';
import 'package:wallet_provider/widgets/budget.dart';
import 'package:wallet_provider/widgets/expense_list.dart';
import 'package:wallet_provider/widgets/header.dart';
import 'package:wallet_provider/widgets/newexpense.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}


 void showAddExpenseWindow(BuildContext context) {
  showModalBottomSheet(
    isDismissible: false,
    context: context, 
    builder: (ctx) {
      return const NewExpense();
  } );
 } 

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<Expenses>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('My Wallet'),
        actions: [
          Platform.isIOS
              ? IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              : const SizedBox()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Stack(
              children:[Budget(expenses.totalMonthlyAmount()), ExpenseList(expenses)],
            ),
          ],
        ),
      ),
      floatingActionButton: Platform.isAndroid ? FloatingActionButton(
        onPressed: () => showAddExpenseWindow(context),
        child:const Icon(Icons.add),
        ) : const SizedBox() ,
    );
  }
}
