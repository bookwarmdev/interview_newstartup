import 'package:flutter/material.dart';
import 'package:interview_newstartup/app.dart';
import 'package:interview_newstartup/presentation/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<CounterProvider>(
          create: (_) => CounterProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
