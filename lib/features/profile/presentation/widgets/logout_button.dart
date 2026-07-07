import 'package:flutter/material.dart';

/// Logout action.
class LogoutButton extends StatelessWidget {
  const LogoutButton({required this.onLogout, super.key});

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: onLogout,
      icon: const Icon(Icons.logout),
      label: const Text('Logout'),
    );
  }
}
