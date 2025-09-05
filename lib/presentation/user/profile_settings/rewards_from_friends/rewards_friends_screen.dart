import 'package:flutter/material.dart';

class RewardsFriendsScreen extends StatelessWidget {
  final int userId;
  const RewardsFriendsScreen({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Rewards"),
      ),
    );
  }
}
