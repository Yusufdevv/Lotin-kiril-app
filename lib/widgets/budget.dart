import 'package:flutter/material.dart';

class Budget extends StatelessWidget {
  final double totalAmountByMonth;
   Budget(this.totalAmountByMonth, {Key? key}) : super(key: key);

  double budgetLimit = 10000000;

  @override
  Widget build(BuildContext context) {
  final budgetPersentage = totalAmountByMonth/budgetLimit *100;

    return Container(
      padding: const EdgeInsets.all(20),
      height: 447,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(239, 240, 250, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Oylik byudjet:', style: TextStyle(fontSize: 16)),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, size: 16, color: Colors.red),
                    label: Text(
                      '${budgetLimit.toStringAsFixed(0)} so\'m',
                      style: const TextStyle(color: Colors.red,fontSize: 16 ),
                    ),
                  ),
                ],
              ),
              Text('${budgetPersentage.toStringAsFixed(1)} %', style:const TextStyle(fontSize: 16))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 5,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(212, 219, 239, 1),
                borderRadius: BorderRadius.circular(10)),
            child: FractionallySizedBox(
              heightFactor: 2,
              widthFactor: budgetPersentage/100,
              child: Container(
                height: 5,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.greenAccent,
                          Colors.greenAccent,
                          Colors.greenAccent.shade200,
                          Colors.greenAccent,
                        ]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.red, blurRadius: 10, spreadRadius: -3)
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
