import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  // Example profile info
  String userName = 'John Doe';
  String userEmail = 'john.doe@example.com';
  String userAvatarUrl =
      'https://example.com/avatar.jpg'; // Replace with actual avatar URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          // Profile Section
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userAvatarUrl),
              radius: 25,
            ),
            title:
                Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(userEmail),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to profile edit page
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProfileEditPage(
                    name: userName,
                    email: userEmail,
                    avatarUrl: userAvatarUrl,
                    onProfileUpdated: (newName, newEmail, newAvatarUrl) {
                      setState(() {
                        userName = newName;
                        userEmail = newEmail;
                        userAvatarUrl = newAvatarUrl;
                      });
                    },
                  ),
                ),
              );
            },
          ),
          Divider(),

          // Theme Mode toggle
          SwitchListTile(
            title: Text('Dark Mode'),
            secondary: Icon(Icons.brightness_6),
            value: isDarkMode,
            onChanged: (bool value) {
              setState(() {
                isDarkMode = value;
                // Here you can also notify your app-level theme provider
              });
            },
          ),
          Divider(),

          // Change Password navigation
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ChangePasswordPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  final String name;
  final String email;
  final String avatarUrl;
  final Function(String, String, String) onProfileUpdated;

  ProfileEditPage({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.onProfileUpdated,
  });

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late String avatarUrl;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    avatarUrl = widget.avatarUrl;
  }

  void _saveProfile() {
    widget.onProfileUpdated(
        _nameController.text, _emailController.text, avatarUrl);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement avatar change (e.g., image picker) if needed
              },
              child: Text('Change Avatar'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProfile, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      // Implement password change logic here (call API etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password changed successfully')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _oldPasswordController,
                decoration: InputDecoration(labelText: 'Old Password'),
                obscureText: true,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter old password' : null,
              ),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
                validator: (val) =>
                    val != null && val.length >= 6 ? null : 'Min 6 characters',
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm New Password'),
                obscureText: true,
                validator: (val) => val == _newPasswordController.text
                    ? null
                    : 'Passwords do not match',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _changePassword, child: Text('Change Password')),
            ],
          ),
        ),
      ),
    );
  }
}
