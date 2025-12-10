import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:therapy_app/Screens/patient_info_screen.dart';
import '../core/Theme/app_colors.dart';
import '../core/Theme/app_text_styles.dart';
import '../providers/patient_provider.dart';

class PatientScreen extends ConsumerStatefulWidget {
  const PatientScreen({super.key});

  @override
  ConsumerState<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends ConsumerState<PatientScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(patientProvider.notifier).fetchAllPatients();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(patientProvider);

    final patients = state.allPatients?.data.data ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SizedBox(height: 40),

          // TOP BAR
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Patients",
                    style: AppTextStyles.heading.copyWith(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),

          const SizedBox(height: 10),

          // SEARCH BAR
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

          // PATIENT LIST
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())

                : patients.isEmpty
                ? const Center(
              child: Text(
                "No patients found",
                style:
                TextStyle(fontSize: 16, color: AppColors.grey),
              ),
            )
                : ListView.builder(
              itemCount: patients.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final patient = patients[index];

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
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: patient.image != null
                            ? NetworkImage(patient.image!)
                            : const AssetImage(
                          "assets/img/user.png",
                        ) as ImageProvider,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              patient.name,
                              style: AppTextStyles.titleBold.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              patient.status,
                              style: AppTextStyles.smallText,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PatientInfoScreen(patient: patient),
                            ),
                          );
                        },
                        child: const Text("View Info"),
                      ),
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
