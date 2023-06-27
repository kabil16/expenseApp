import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.name,style: Theme.of(context).textTheme.titleLarge,), 
            Row(children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(children: [
                 Icon(categoryIcons[expense.category]),
                //  const Spacer(),
                const SizedBox(width: 10,),
                 Text(expense.formatDate),
              ],)
            ],)
          ],
        ),
      ),
    );
  }
}
