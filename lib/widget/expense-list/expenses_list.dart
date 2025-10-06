import 'package:flutter/material.dart';
import 'package:third_app/model/expense.dart';
import 'package:third_app/widget/expense-list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.onRemovedExpense,
  });

  final List<Expense> expensesList;
  final void Function(Expense expense) onRemovedExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expensesList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) {
          onRemovedExpense(expensesList[index]);
        },
        child: ExpenseItem(expensesList[index]),
      ),
    );
  }
}
