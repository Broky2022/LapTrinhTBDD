import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String username;
  final String email;

  const UserInfoWidget(
      {super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Username: $username', style: const TextStyle(fontSize: 20)),
        Text('Email: $email', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin người dùng'),
      ),
      body: const Center(
        child: UserInfoWidget(
            username: "cici",
            email: 'ci@mail.com'
        ),
      ),
    );
  }
}
