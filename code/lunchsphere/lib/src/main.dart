import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lunchsphere/src/pages/home_page.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // wrap with user_provider
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'LunchSphere',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
          brightness: Brightness.light,
        ),
        home: HomePage(),
      ),
    );
  }
}
