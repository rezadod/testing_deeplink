import 'package:deeplink_test/repositories/user_repository.dart';
import 'package:deeplink_test/services/deep_link_service.dart';
import 'package:deeplink_test/view/reward/reward.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DeepLinkService.instance?.handleDynamicLinks();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    UserRepository.instance.listenToCurrentAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reward App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RewardWidget(),
    );
  }
}
