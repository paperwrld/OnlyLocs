import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rando/app/cubit/app_cubit.dart';
import 'package:rando/features/profile/profile.dart';
import 'package:rando/theme/theme_cubit.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({
    required this.profileCubit,
    required this.userID,
    super.key,
  });
  final String userID;
  final ProfileCubit profileCubit;
  static MaterialPage<void> page({
    required String userID,
    required ProfileCubit profileCubit,
  }) {
    return MaterialPage<void>(
      child: ProfileSettingsPage(userID: userID, profileCubit: profileCubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.read<ThemeCubit>().isDarkMode;
    return CustomPageView(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const AppBarText(text: 'User Settings'),
      ),
      top: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionButton(
              text: 'Theme: ${isDarkMode ? 'Dark Mode' : 'Light Mode'}',
              inverted: false,
              onTap: () => context.read<ThemeCubit>().toggleTheme(),
            ),
            ActionButton(
              inverted: false,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) {
                    return BlocProvider.value(
                      value: profileCubit,
                      child: EditProfilePage(userID: userID),
                    );
                  },
                ),
              ),
              text: 'Edit Profile',
            ),
            ActionButton(
              inverted: false,
              onTap: context.read<AppCubit>().logOut,
              text: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
