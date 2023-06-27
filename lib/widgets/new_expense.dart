import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});
  final void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _expenseTitleController = TextEditingController();
  final _expenseAmountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  @override
  void dispose() {
    _expenseTitleController.dispose();
    _expenseAmountController.dispose();
    super.dispose();
  }

  void _saveExpenseData() {
    final enterdAmount = double.tryParse(_expenseAmountController.text);
    final isAmounntInvalid = enterdAmount == null || enterdAmount <= 0;
    if (_expenseTitleController.text.trim().isEmpty ||
        isAmounntInvalid ||
        _selectedDate == null) {
      // error messageb here
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text("Please check the title,amont, date"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    // print('lets go');
    widget.addExpense(
      Expense(
        name: _expenseTitleController.text,
        amount: enterdAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final initDte = DateTime.now();
    final firstDte = DateTime(initDte.year - 1);
    final pickedDte = await showDatePicker(
        context: context,
        initialDate: initDte,
        firstDate: firstDte,
        lastDate: initDte,
        initialEntryMode: DatePickerEntryMode.calendarOnly);
    setState(() {
      _selectedDate = pickedDte;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _expenseTitleController,
            keyboardType: TextInputType.text,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Expense title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expenseAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Pick Date'
                          : dateFormatter.format(_selectedDate!),
                    ),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: _saveExpenseData,
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
