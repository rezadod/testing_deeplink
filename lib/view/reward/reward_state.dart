import 'package:deeplink_test/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class RewardState extends ChangeNotifier {
  final userRepo = UserRepository.instance;
}
