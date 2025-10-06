import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMEd();
const uuid = Uuid();

enum Category { Food, Leisure, Travel, work }

const categoryIcon = {
  Category.Food: Icons.lunch_dining,
  Category.Leisure: Icons.movie,
  Category.Travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final double amount;
  final String title;
  final Category category;
  final DateTime date;

  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();

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
