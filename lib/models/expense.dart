// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  cinema,
  leisure,
}

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.cinema: Icons.movie,
  Category.travel: Icons.flight,
  Category.leisure: Icons.photo_album
};

class Expense {
  Expense({
    // required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatDate {
    return dateFormatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) =>expense.category==category).toList();
  final Category category;
  final List<Expense> expenses;
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
