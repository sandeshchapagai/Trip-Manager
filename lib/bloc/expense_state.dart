// Bloc
import 'expense_bloc.dart';

class ExpenseState {
  final List<Group> groups;
  final Group? selectedGroup;

  ExpenseState({required this.groups, this.selectedGroup});

  ExpenseState copyWith({List<Group>? groups, Group? selectedGroup}) {
    return ExpenseState(
      groups: groups ?? this.groups,
      selectedGroup: selectedGroup ?? this.selectedGroup,
    );
  }
}
