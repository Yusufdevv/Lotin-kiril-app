import 'package:flutter/material.dart';
// import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_provider/provider/expenses_p.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  DateTime? selectedDate;
  // IconData? selectedIcon;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  double _amount = 0;

  void showNewExpenseCalendar(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021, 1),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        selectedDate = date;
      });
    });
  }

  void submit() {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    if(selectedDate == null && titleController.text.isEmpty && amountController.text.isEmpty) {
      return;
    }
    Provider.of<Expenses>(context,  listen: false).addNewExpense(UniqueKey().toString(), _title, selectedDate!, _amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Xarajat nomi'),
              validator: (value) {
                if(value == null ||  value.isEmpty ) {
                  return 'Xarajat nomini kiriting';
                }
              } ,
              onSaved: (value) {
                _title = value!;
              },
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Xarajat miqdori'),
              validator: (value) {
                if(value == null ||  value.isEmpty ) {
                  return 'Xarajat miqdorini kiriting!';
                } else if(double.tryParse(value)== null) {
                  return 'To\'g\'ri narxni kiriting!';
                } else if(double.parse(value) < 1){
                  return 'Xarajat narxni 0 dan katta bo\'lishi kerak!';
                }
              } ,
              onSaved: (value) {
                _amount= double.parse(value!);
              },
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    selectedDate != null
                        ? 'Xarajat kuni : ${DateFormat('d MMMM, y').format(selectedDate!)}'
                        : 'Xarajat kuni tanlanmadi!',
                    style: const TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {
                    showNewExpenseCalendar(context);
                  },
                  child: const Text('KUNNI TANLASH'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Icon tanlanmagan!', style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {},
                  child: const Text('ICONNI TANLASH'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('BEKOR QILISH'),
                ),
                ElevatedButton(
                    onPressed: () {
                        submit();
                    },
                    child: const Text('KIRITISH'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
