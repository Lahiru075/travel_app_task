import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;

  AuthState({required this.isAuthenticated, this.isLoading = false});
}

final authServiceProvider = Provider((ref) => AuthService());

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(AuthState(isAuthenticated: false)) {
    _checkInitialAuth(); 
  }

  Future<void> _checkInitialAuth() async {
    final token = await _authService.getToken();
    if (token != null) {
      state = AuthState(isAuthenticated: true);
    }
  }

  Future<bool> login(String email, String password) async {
    state = AuthState(isAuthenticated: false, isLoading: true);
    final success = await _authService.login(email, password);
    
    if (success) {
      state = AuthState(isAuthenticated: true, isLoading: false);
    } else {
      state = AuthState(isAuthenticated: false, isLoading: false);
    }
    return success;
  }

  Future<bool> register(String name, String email, String password) async {
    state = AuthState(isAuthenticated: false, isLoading: true);
    final success = await _authService.register(name, email, password);
    state = AuthState(isAuthenticated: false, isLoading: false);
    return success;
  }

  Future<void> logout() async {
    await _authService.logout();
    state = AuthState(isAuthenticated: false);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});