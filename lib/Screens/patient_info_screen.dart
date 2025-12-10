import 'package:flutter/material.dart';
import '../../core/Theme/app_colors.dart';
import '../../core/Theme/app_text_styles.dart';
import '../models/all_patient_model.dart';

class PatientInfoScreen extends StatelessWidget {
  final Datum patient;

  const PatientInfoScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // HEADER -------------------------------------------------
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primary,
                      size: 26,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  Text("Patient", style: AppTextStyles.heading),
                ],
              ),

              const SizedBox(height: 20),

              // PROFILE SECTION ----------------------------------------
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: patient.image != null
                        ? NetworkImage(patient.image!)
                        : const AssetImage("assets/profile.jpg")
                    as ImageProvider,
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient.name,
                          style: AppTextStyles.titleBold.copyWith(fontSize: 22),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          patient.phone,
                          style: AppTextStyles.smallText,
                        ),
                        Text(
                          "ID: ${patient.id}",
                          style: AppTextStyles.smallText,
                        ),
                        Text(
                          patient.email,
                          style: AppTextStyles.bodyBold,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.softGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      patient.status,
                      style: AppTextStyles.bodyBold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // STATS ROW 1 --------------------------------------------
              Row(
                children: [
                  _statBox("Total Sessions", patient.visitsCount.toString()),
                  const SizedBox(width: 10),
                  _statBox("Packages", patient.packagesCount.toString()),
                ],
              ),

              const SizedBox(height: 10),

              // STATS ROW 2 --------------------------------------------
              Row(
                children: [
                  _statBox("Invoices", patient.invoicesCount.toString()),
                  const SizedBox(width: 10),
                  _statBox("Balance Due", "PKR 0"),
                ],
              ),

              const SizedBox(height: 25),

              // BASIC INFO ---------------------------------------------
              _sectionTitle("Basic Info"),
              const SizedBox(height: 10),

              _infoBox([
                _infoItem(Icons.call, patient.phone),
                _infoItem(Icons.email, patient.email),
                _infoItem(Icons.credit_card, patient.cnic),
                _infoItem(Icons.location_on,
                    patient.address?.toString() ?? "No address"),
              ]),

              const SizedBox(height: 25),

              // MEDICAL INFO (STATIC) ----------------------------------
              _sectionTitle("Medical Info"),
              const SizedBox(height: 10),

              _infoBox([
                _twoSideRow(
                    "Created On",
                    "${patient.createdAt.year}-${patient.createdAt.month}-${patient.createdAt.day}"),
                const SizedBox(height: 10),
                Text(
                  "Medical History: No detailed medical history in API",
                  style: AppTextStyles.body,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // -----------------------------------------------------------------
  // WIDGETS BELOW
  // -----------------------------------------------------------------

  Widget _statBox(String title, String value, {IconData? icon}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: AppColors.borderLight),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.smallText),
            const SizedBox(height: 6),
            icon == null
                ? Text(
              value,
              style: AppTextStyles.titleBold.copyWith(fontSize: 20),
            )
                : Icon(icon, size: 28, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _infoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: AppTextStyles.body),
          ),
        ],
      ),
    );
  }

  Widget _twoSideRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: AppTextStyles.bodyBold),
        Text(right, style: AppTextStyles.body),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.titleBold.copyWith(
        fontSize: 20,
        color: AppColors.primary,
      ),
    );
  }
}
