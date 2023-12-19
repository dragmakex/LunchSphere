import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunchsphere/src/pages/ab_chooser.dart';
import 'package:lunchsphere/src/pages/home_page_a.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/providers/statistics_provider.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:provider/provider.dart';
import 'package:lunchsphere/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // wrap with user_provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(
          create: (_) => DataProvider(),
        ),
        ChangeNotifierProvider<StatisticsProvider>(
          create: (_) => StatisticsProvider(),
        ),
      ],
      child: const AppWrapper(),
    );
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _AppWrapperState();
  }
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return Listener(
      // onPointerDown: (event) => print("down"),
      onPointerUp: (event) {
        context.read<StatisticsProvider>().incrementGestureCount();
      },
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'LunchSphere',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
          brightness: Brightness.light,
        ),
        initialRoute: Routes.homeRoute,
        onGenerateRoute: Routes.generateRoute,
        home: HomePageA(),
      ),
    );
  }
}
