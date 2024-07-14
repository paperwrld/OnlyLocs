// dart packages
import 'package:flutter/material.dart';
import 'package:rando/components/activity_feed.dart';
// import 'package:provider/provider.dart';
import 'package:rando/components/buttons/custom_button.dart';
import 'package:rando/pages/profile/profile.dart';
import 'package:rando/services/auth.dart';
// import 'package:rando/utils/theme/theme_provider.dart';

// show list screen if logged in otherwise show sign in page
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthService authService;

  @override
  void initState() {
    super.initState();
    authService = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    // ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    inverted: false,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfileScreen(userID: authService.user!.uid),
                      ),
                    ),
                    icon: Icons.person,
                  ),
                  Text(
                    "LocalsOnly",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  CustomButton(
                    inverted: false,
                    onTap: () => Navigator.pushNamed(context, '/create'),
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: ActivityFeedWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
