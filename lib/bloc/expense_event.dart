import 'expense_bloc.dart';

abstract class ExpenseEvent {}

class LoadGroups extends ExpenseEvent {}

class SelectGroup extends ExpenseEvent {
  final Group group;
  SelectGroup(this.group);
}

class AddExpense extends ExpenseEvent {
  final Expense expense;
  AddExpense(this.expense);
}
