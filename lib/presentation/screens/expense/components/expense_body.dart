// UI Part Only — Flutter Widgets for Group Expense Tracker

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_manager/bloc/expense_bloc.dart';
import 'package:trip_manager/core/routes/route_navigator.dart';

import '../../../../bloc/expense_event.dart';
import '../../../../bloc/expense_state.dart';

class GroupListScreen extends StatelessWidget {
  const GroupListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Groups')),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.groups.length,
            itemBuilder: (context, index) {
              final group = state.groups[index];
              return ListTile(
                title: Text(group.name),
                subtitle:
                    Text('Total: Rs. ${group.totalExpense.toStringAsFixed(2)}'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.read<ExpenseBloc>().add(SelectGroup(group));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GroupDetailScreen()),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouteNavigator.navigate(
            context,
            AddExpenseScreen(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class GroupDetailScreen extends StatelessWidget {
  const GroupDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Group Details')),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          final group = state.selectedGroup!;
          final balances = _calculateBalances(group);

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Member Balances',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              ...group.members.map((m) {
                final balance = balances[m.id] ?? 0;
                final color = balance > 0
                    ? Colors.green
                    : (balance < 0 ? Colors.red : Colors.grey);
                final label =
                    balance > 0 ? 'Gets' : (balance < 0 ? 'Owes' : 'Settled');
                return ListTile(
                  title: Text(m.name),
                  subtitle:
                      Text('$label Rs. ${balance.abs().toStringAsFixed(2)}'),
                  trailing: Icon(Icons.account_balance_wallet, color: color),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }

  Map<String, double> _calculateBalances(Group group) {
    final balances = <String, double>{};
    final shareMap = <String, double>{};

    for (final expense in group.expenses) {
      final share = expense.amount / expense.sharedWith.length;
      for (final userId in expense.sharedWith) {
        shareMap[userId] = (shareMap[userId] ?? 0) + share;
      }
      balances[expense.paidBy] =
          (balances[expense.paidBy] ?? 0) + expense.amount;
    }

    group.members.forEach((m) {
      balances[m.id] = (balances[m.id] ?? 0) - (shareMap[m.id] ?? 0);
    });

    return balances;
  }
}

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  String? paidBy;
  List<String> sharedWith = [];

  @override
  Widget build(BuildContext context) {
    final group = context.read<ExpenseBloc>().state.selectedGroup ??
        Group(
          id: 'default',
          name: 'Default Group',
          members: [
            Member(id: '1', name: 'Alice'),
            Member(id: '2', name: 'Bob'),
            Member(id: '3', name: 'Charlie'),
          ],
          expenses: [
            Expense(
              id: '1',
              title: 'Sample Expense',
              amount: 100.0,
              paidBy: '1',
              sharedWith: ['2', '3'],
            ),
          ],
        );

    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                hint: Text('Paid By'),
                value: paidBy,
                items: group.members
                    .map((m) =>
                        DropdownMenuItem(value: m.id, child: Text(m.name)))
                    .toList(),
                onChanged: (val) => setState(() => paidBy = val!),
              ),
              SizedBox(height: 12),
              Text('Shared With:'),
              Wrap(
                spacing: 8.0,
                children: group.members.map((m) {
                  final selected = sharedWith.contains(m.id);
                  return FilterChip(
                    label: Text(m.name),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        if (selected)
                          sharedWith.remove(m.id);
                        else
                          sharedWith.add(m.id);
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final newExpense = Expense(
                      id: DateTime.now().toString(),
                      title: titleController.text,
                      amount: double.tryParse(amountController.text) ?? 0,
                      paidBy: paidBy!,
                      sharedWith: sharedWith,
                    );
                    context.read<ExpenseBloc>().add(AddExpense(newExpense));
                    Navigator.pop(context);
                  },
                  child: Text('Add Expense'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
