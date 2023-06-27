// import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

// here I'm going to show list of expenses here, due to that I need expenses list
// first I need to declare expese type
class ExpenseListy extends StatelessWidget {
  const ExpenseListy(
      {super.key, required this.expenses, required this.removeExpense});

  // here this is expenses which is a list type and It's using Modal of Expense
  //the model file imported here
  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            
          ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            removeExpense(expenses[index]);
          },
          child: ExpenseItem(
            expense: expenses[index],
          ),
        );
      },
    );
  }
}
