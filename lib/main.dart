// dart packages
import 'package:flutter/material.dart';

// provider for streaming data
import 'package:provider/provider.dart';

// firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'package:rando/utils/global.dart';
import 'firebase_options.dart';

// utils
import 'package:rando/utils/routes.dart';
import 'package:rando/utils/theme/theme_provider.dart';

// env for security
import 'package:flutter_dotenv/flutter_dotenv.dart';

// pages
import 'package:rando/pages/reroute/page_not_found.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // initialize flutterfire
      future: _initialization,
      builder: (context, snapshot) {
        // error loading firebase
        if (snapshot.hasError) {
          return const Text('error', textDirection: TextDirection.ltr);
        }

        // firebase loading complete
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            onUnknownRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const PageNotFoundScreen(),
              );
            },
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            routes: appRoutes,
            theme: Provider.of<ThemeProvider>(context).themeData,
          );
        }

        // loading firebase
        return const Text('loading', textDirection: TextDirection.ltr);
      },
    );
  }
}
