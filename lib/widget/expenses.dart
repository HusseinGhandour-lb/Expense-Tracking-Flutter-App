import 'package:flutter/material.dart';
import 'package:third_app/widget/chart/chart.dart';
import 'package:third_app/widget/expense-list/expenses_list.dart';
import 'package:third_app/model/expense.dart';
import 'package:third_app/widget/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(
      amount: 10,
      title: "course",
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      amount: 50,
      title: "movie",
      date: DateTime.now(),
      category: Category.Leisure,
    ),
  ];

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(_addExpense),
      isScrollControlled: true,
      useSafeArea: true
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerdExpenses.indexOf(expense);
    setState(() {
      _registerdExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Deleted'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerdExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(child: Text('No exepenses found'));

    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: _registerdExpenses,
        onRemovedExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverLay, icon: Icon(Icons.add)),
        ],
      ),
      body: width <600 ? Column(
        children: [
          Chart(expenses: _registerdExpenses),
          Expanded(child: mainContent),
        ],
      ) : Row(children: [
          Expanded(child: Chart(expenses: _registerdExpenses)),
          Expanded(child: mainContent),
      ],),
    );
  }
}
