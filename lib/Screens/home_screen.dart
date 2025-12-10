import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/Screens/login_screen.dart';
import 'package:therapy_app/Screens/patient_screen.dart';
import 'package:therapy_app/Screens/profile_screen.dart';
import 'package:therapy_app/Screens/user_screen.dart';
import 'package:therapy_app/Widgets/bar_widget.dart';
import '../Widgets/drawer_widget.dart';
import '../Widgets/patient_card_widget.dart';
import '../core/Theme/app_colors.dart';
import '../core/Theme/app_text_styles.dart';
import '../providers/auth_provider.dart';
import '../providers/patient_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String selectedRange = "Days";

  final Map<String, int> totalPatients = {
    "Days": 56,
    "Weeks": 213,
    "Months": 1225,
  };

  final Map<String, List<double>> barHeights = {
    "Days": [80, 120, 60, 90, 40, 110],
    "Weeks": [140, 160, 100, 180, 90, 150],
    "Months": [200, 240, 180, 260, 210, 230],
  };

  double maxBarHeight = 150;

  List<double> getNormalizedHeights(String category) {
    final values = barHeights[category]!;
    final maxValue = values.reduce((a, b) => a > b ? a : b);
    return values.map((v) => (v / maxValue) * maxBarHeight).toList();
  }

  Widget tabButton(String text) {
    bool isSelected = selectedRange == text;
    return GestureDetector(
      onTap: () => setState(() => selectedRange = text),
      child: Text(
        text,
        style: isSelected
            ? AppTextStyles.titleBold.copyWith(color: AppColors.primary)
            : AppTextStyles.body.copyWith(color: AppColors.textSecondary),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(patientProvider.notifier).fetchAllPatients();
    });
  }


  @override
  Widget build(BuildContext context) {

    final user = ref.watch(authProvider.notifier).user;

    final authState = ref.watch(authProvider);
    final loginData = authState.loginData;
    final allUsers = loginData?.data.allUsers ?? [];

    final patientState = ref.watch(patientProvider);


    List<double> bars = getNormalizedHeights(selectedRange);

    return Scaffold(
      drawer: CustomDrawer(
        onDashboard: () => Navigator.pop(context),
        onUsers: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserScreen()),
          );
        },
        onPatients: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PatientScreen()),
          );
        },
        onSetting: () => Navigator.pop(context),
        onLogout: () async {
          // Clear the user session data
          await ref.read(authProvider.notifier).logout();
          // Navigate back to the login screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false, // This removes all previous routes
          );
        },
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // ---------------- TOP BAR ----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Icon(
                          Icons.tune,
                          size: 28,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        "Clinical",
                        style: AppTextStyles.heading.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.grey.shade200,

                          // If valid HTTP URL → show image
                          backgroundImage: (user?.profilePicture != null &&
                              user!.profilePicture.startsWith('http'))
                              ? NetworkImage(user.profilePicture)
                              : null,

                          // If NO valid image → show icon
                          child: (user?.profilePicture == null ||
                              !user!.profilePicture.startsWith('http'))
                              ? const Icon(Icons.person, color: Colors.grey)
                              : null,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ---------------- USERS SECTION ----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Users", style: AppTextStyles.titleBold),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "View all",
                          style: AppTextStyles.bodyBold.copyWith(
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 80,
                    child: allUsers.isEmpty
                        ? const Center(child: Text("No users found"))
                        : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allUsers.length,
                      itemBuilder: (context, index) {
                        final u = allUsers[index];
                        return UserCircle(u.profilePicture);
                      },
                    ),
                  ),


                  const SizedBox(height: 20),

                  // ---------------- PATIENTS SECTION ----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Patients", style: AppTextStyles.titleBold),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PatientScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "View all",
                          style: AppTextStyles.bodyBold.copyWith(
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ---------------- PATIENT GRID VIEW ----------------
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Builder(
                      builder: (context) {
                        if (patientState.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        // If error or no data
                        if (patientState.allPatients == null ||
                            patientState.allPatients!.data.data.isEmpty) {
                          return const Center(child: Text("No patients found"));
                        }

                        final patients = patientState.allPatients!.data.data;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: patients.length > 6 ? 6 : patients.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.85,
                          ),
                          itemBuilder: (context, index) {
                            final p = patients[index];

                            return PatientCardWidget(
                              p.name,
                              p.image ?? "",
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text("Patients Records", style: AppTextStyles.titleBold),

                  const SizedBox(height: 12),

                  // ---------------- CHART ----------------
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Patients",
                                  style: AppTextStyles.smallText,
                                ),
                                Text(
                                  totalPatients[selectedRange].toString(),
                                  style: AppTextStyles.heading.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.calendar_month_rounded,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            tabButton("Days"),
                            const SizedBox(width: 14),
                            tabButton("Weeks"),
                            const SizedBox(width: 14),
                            tabButton("Months"),
                          ],
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          height: 180,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(6, (i) {
                              return BarWidget(
                                label: [
                                  "Mon",
                                  "Tue",
                                  "Wed",
                                  "Thu",
                                  "Fri",
                                  "Sat",
                                ][i],
                                height: bars[i],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------------- USER CIRCLE ----------------

class UserCircle extends StatelessWidget {
  final String? img;
  const UserCircle(this.img, {super.key});

  @override
  Widget build(BuildContext context) {
    final hasImage = img != null && img!.startsWith('http');
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        radius: 35, // Slightly adjusted size
        backgroundColor: AppColors.softGreen,
        child: CircleAvatar(
          radius: 33,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: hasImage ? NetworkImage(img!) : null,
          child: !hasImage
              ? const Icon(Icons.person, color: Colors.grey, size: 30)
              : null,
        ),
      ),
    );
  }
}
