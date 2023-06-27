import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Expense> _registerdExpense = [
    // Expense(
    //   name: 'VidaMuyatchi',
    //   amount: 15.99,
    //   date: DateTime.now(),
    //   category: Category.cinema,
    // )
  ];
  _openOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(addExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpense.add(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Data Addes'),
      ),
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerdExpense.indexOf(expense);
    setState(() {
      _registerdExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerdExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(child: Text('No data available here'));
    if (_registerdExpense.isNotEmpty) {
      mainContent = ExpenseListy(
          expenses: _registerdExpense, removeExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker App'),
        actions: [
          IconButton(
            onPressed: _openOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registerdExpense),
                  Expanded(
                    child: mainContent,
                  )
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registerdExpense)),
                  Expanded(
                    child: mainContent,
                  )
                ],
              ),
      ),
    );
  }
}
