import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/Screens/patient_info_screen.dart';
import 'package:therapy_app/models/login_model.dart';
import '../core/Theme/app_colors.dart';
import '../core/Theme/app_text_styles.dart';
import '../providers/auth_provider.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  String searchQuery = "";

  // Convert DOB string → age
  int _calculateAge(String? dobString) {
    if (dobString == null || dobString.isEmpty) return 0;
    try {
      final dob = DateTime.parse(dobString);
      final now = DateTime.now();
      int age = now.year - dob.year;

      if (now.month < dob.month ||
          (now.month == dob.month && now.day < dob.day)) {
        age--;
      }
      return age;
    } catch (_) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final loginData = authState.loginData;
    final allUsers = loginData?.data.allUsers ?? [];
    final List<AllUser> filteredUsers =
    allUsers.where((u) => u.username != 'superadmin').toList();



    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [
          const SizedBox(height: 40),

          // ----------- TOP BAR -----------
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Users",
                    style: AppTextStyles.heading.copyWith(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),

          const SizedBox(height: 10),

          // ----------- SEARCH BAR -----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search, color: AppColors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // ----------- User LIST -----------
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final AllUser patient = filteredUsers[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(1, 2),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      // ----------- PROFILE IMAGE -----------
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(patient.profilePicture),
                      ),

                      const SizedBox(width: 14),

                      // ----------- NAME + GENDER -----------
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              patient.name,
                              style: AppTextStyles.titleBold.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              patient.username,
                              style: AppTextStyles.smallText,
                            ),
                          ],
                        ),
                      ),

                      // ----------- VIEW BUTTON -----------
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const PatientInfoScreen(),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text("View Info"),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
