// Flutter BLoC Logic for Group Expense Tracker

// Models
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expense_event.dart';
import 'expense_state.dart';

class Group {
  final String id;
  final String name;
  final List<Member> members;
  final List<Expense> expenses;

  Group({
    required this.id,
    required this.name,
    required this.members,
    required this.expenses,
  });

  Group copyWith({
    String? id,
    String? name,
    List<Member>? members,
    List<Expense>? expenses,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      members: members ?? this.members,
      expenses: expenses ?? this.expenses,
    );
  }

  double get totalExpense => expenses.fold(0, (sum, e) => sum + e.amount);
}

class Member {
  final String id;
  final String name;

  Member({required this.id, required this.name});
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final String paidBy;
  final List<String> sharedWith;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.paidBy,
    required this.sharedWith,
  });
}

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc()
      : super(ExpenseState(groups: [
          Group(
            id: 'default',
            name: 'Default Group',
            members: [
              Member(id: '1', name: 'Alice'),
              Member(id: '2', name: 'Bob'),
              Member(id: '3', name: 'Charlie'),
            ],
            expenses: [],
          ),
        ])) {
    on<LoadGroups>((event, emit) {
      emit(state.copyWith(groups: _mockGroups()));
    });

    on<SelectGroup>((event, emit) {
      emit(state.copyWith(selectedGroup: event.group));
    });

    on<AddExpense>((event, emit) {
      if (state.selectedGroup != null) {
        final updatedExpenses = [
          ...state.selectedGroup!.expenses,
          event.expense
        ];
        final updatedGroup =
            state.selectedGroup!.copyWith(expenses: updatedExpenses);
        final updatedGroups = state.groups
            .map((g) => g.id == updatedGroup.id ? updatedGroup : g)
            .toList();
        emit(
            state.copyWith(groups: updatedGroups, selectedGroup: updatedGroup));
      }
    });
  }

  List<Group> _mockGroups() {
    final member1 = Member(id: '1', name: 'Sandesh');
    final member2 = Member(id: '2', name: 'Rohit');
    final member3 = Member(id: '3', name: 'Aayush');

    return [
      Group(
        id: 'g1',
        name: 'Pokhara Trip',
        members: [member1, member2, member3],
        expenses: [],
      ),
    ];
  }
}
