import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/patient_service.dart';
import '../models/all_patient_model.dart';
import '../models/patient_model.dart';

final patientProvider =
StateNotifierProvider<PatientNotifier, PatientState>((ref) {
  return PatientNotifier(PatientService());
});

class PatientState {
  final bool isLoading;
  final String? error;
  final AllPatientModel? allPatients;
  final PatientModel? singlePatient;

  PatientState({
    this.isLoading = false,
    this.error,
    this.allPatients,
    this.singlePatient,
  });

  PatientState copyWith({
    bool? isLoading,
    String? error,
    AllPatientModel? allPatients,
    PatientModel? singlePatient,
  }) {
    return PatientState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      allPatients: allPatients ?? this.allPatients,
      singlePatient: singlePatient ?? this.singlePatient,
    );
  }
}

class PatientNotifier extends StateNotifier<PatientState> {
  final PatientService service;

  PatientNotifier(this.service) : super(PatientState());

  // --------------------------------------------------
  // LOAD ALL PATIENTS
  // --------------------------------------------------
  Future<void> fetchAllPatients() async {
    state = state.copyWith(isLoading: true);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      state = state.copyWith(
        isLoading: false,
        error: "Token missing",
      );
      return;
    }

    try {
      final model = await PatientService.getAllPatients(token);

      state = state.copyWith(
        isLoading: false,
        allPatients: model,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  // --------------------------------------------------
  // LOAD SINGLE PATIENT BY ID
  // --------------------------------------------------
  Future<void> fetchPatientById(String id) async {
    state = state.copyWith(isLoading: true);

    final data = await service.getPatientById(id);

    if (data == null) {
      state = state.copyWith(
        isLoading: false,
        error: "Failed to fetch patient",
      );
      return;
    }

    final model = PatientModel.fromJson(data);

    state = state.copyWith(
      isLoading: false,
      singlePatient: model,
      error: null,
    );
  }
}
