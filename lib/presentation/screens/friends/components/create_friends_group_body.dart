import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateFriendsGroupBody extends StatefulWidget {
  const CreateFriendsGroupBody({super.key});

  @override
  _CreateFriendsGroupBodyState createState() => _CreateFriendsGroupBodyState();
}

class _CreateFriendsGroupBodyState extends State<CreateFriendsGroupBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  XFile? _groupAvatar;
  final ImagePicker _picker = ImagePicker();

  // Example contact list — replace with actual contacts
  final List<String> allContacts = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eva',
  ];

  // Track selected contacts
  final Set<String> selectedContacts = {};

  // Track invited emails
  final List<String> invitedEmails = [];

  Future<void> _pickAvatar() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _groupAvatar = pickedFile;
      });
    }
  }

  void _addEmail() {
    if (_emailController.text.isNotEmpty &&
        _validateEmail(_emailController.text)) {
      setState(() {
        invitedEmails.add(_emailController.text.trim());
        _emailController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Enter a valid email address.')),
      );
    }
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Access form values:
      final groupName = _groupNameController.text.trim();
      final avatarPath = _groupAvatar?.path;
      final members = selectedContacts.toList();
      final emails = invitedEmails;

      // TODO: Handle form submission (e.g., call API, create group, send invites)

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Group Created'),
          content: Text(
            'Name: $groupName\n'
            'Avatar: ${avatarPath ?? "None"}\n'
            'Members: ${members.join(', ')}\n'
            'Invited Emails: ${emails.join(', ')}',
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('OK')),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Group')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Group Name input
              TextFormField(
                controller: _groupNameController,
                decoration: InputDecoration(
                  labelText: 'Group Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a group name'
                    : null,
              ),
              SizedBox(height: 16),

              // Group Avatar picker
              Row(
                children: [
                  _groupAvatar == null
                      ? CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.group, size: 40),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(
                            File(_groupAvatar!.path),
                          ),
                        ),
                  SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: _pickAvatar,
                    icon: Icon(Icons.photo),
                    label: Text('Select Avatar'),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Contact multi-selection
              Text(
                'Select Members',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 8,
                children: allContacts.map((contact) {
                  final isSelected = selectedContacts.contains(contact);
                  return FilterChip(
                    label: Text(contact),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedContacts.add(contact);
                        } else {
                          selectedContacts.remove(contact);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 24),

              Text(
                'Invite by Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addEmail,
                    child: Text('Add'),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Display invited emails as chips
              Wrap(
                spacing: 6,
                children: invitedEmails
                    .map((email) => Chip(
                          label: Text(email),
                          onDeleted: () {
                            setState(() {
                              invitedEmails.remove(email);
                            });
                          },
                        ))
                    .toList(),
              ),

              SizedBox(height: 36),

              // Submit button
              ElevatedButton(
                onPressed: _submit,
                child: Text('Create Group'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
