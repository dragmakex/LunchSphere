import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunchsphere/src/pages/ab_chooser.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/providers/statistics_provider.dart';
import 'package:lunchsphere/src/services/notificatino_services.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
  late final NotificationService notificationService;
  @override
  void initState() {
    notificationService = NotificationService();
    listenToNotificationStream();
    notificationService.initializePlatformNotifications();
    super.initState();
  }

  void listenToNotificationStream() =>
      notificationService.behaviorSubject.listen((payload) {
        Navigator.pushNamed(
          context,
          Routes.aTest,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Listener(
      // onPointerDown: (event) => print("down"),
      onPointerUp: (event) {
        context.read<StatisticsProvider>().incrementGestureCount();
      },
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'LunchSphere',
        theme: CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
          brightness: Brightness.light,
        ),
        initialRoute: Routes.homeRoute,
        onGenerateRoute: Routes.generateRoute,
        home: ABChooser(),
      ),
    );
  }
}
