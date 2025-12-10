import 'package:flutter_riverpod/legacy.dart';
import '../Services/auth_services.dart';
import '../models/login_model.dart';

class AuthState {
  final bool isLoading;
  final LoginModel? loginData;
  final String? error;

  AuthState({
    this.isLoading = false,
    this.loginData,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    LoginModel? loginData,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      loginData: loginData ?? this.loginData,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _service;

  AuthNotifier(this._service) : super(AuthState()) {
    _loadSavedLoginData(); // Load saved data automatically
  }

  // -------------------------------------------------
  // AUTO-LOAD SAVED LOGIN DATA ON APP START
  // -------------------------------------------------
  Future<void> _loadSavedLoginData() async {
    final saved = await _service.loadSavedLogin();

    if (saved != null) {
      state = state.copyWith(loginData: saved);
    }
  }

  // -------------------------------------------------
  // LOGIN
  // -------------------------------------------------
  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _service.login(email, password);

    if (result != null) {
      state = state.copyWith(isLoading: false, loginData: result);
      return true;
    } else {
      state = state.copyWith(isLoading: false, error: "Invalid email or password");
      return false;
    }
  }

  // -------------------------------------------------
  // LOGOUT
  // -------------------------------------------------
  Future<void> logout() async {
    await _service.logout();
    state = AuthState();
  }

  // -------------------------------------------------
  // GETTERS → easier access in UI
  // -------------------------------------------------

  // Logged-in user
  User? get user => state.loginData?.data.user;

  // All users list
  List<AllUser> get allUsers => state.loginData?.data.allUsers ?? [];

  // All employees list
  List<Employee> get allEmployees => state.loginData?.data.allEmployees ?? [];

  // Token
  String? get token => state.loginData?.data.accessToken;
}

final authProvider =
StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthService());
});
