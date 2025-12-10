import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Widgets/info_box_widget.dart';
import '../core/Theme/app_colors.dart';
import '../core/Theme/app_text_styles.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider.notifier).user;

    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(190),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon:
                    const Icon(Icons.arrow_back_ios, color: AppColors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Profile",
                      style: AppTextStyles.titleBold.copyWith(
                        color: AppColors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(135, 170),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage( user.profilePicture),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Edit Profile",
                style: AppTextStyles.bodyBold.copyWith(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Information",
              style: AppTextStyles.heading.copyWith(
                color: AppColors.primary,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 60),
            infoBox("Username:", user.name),
            const SizedBox(height: 15),
            infoBox("Email:", user.email),
            const SizedBox(height: 15),
            infoBox("Joined:", user.createdAt.toLocal().toString().split(' ').first),

            const SizedBox(height: 15),
            infoBox("Last Login:", user.updatedAt.toLocal().toString().split(' ').first),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
