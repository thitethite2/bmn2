import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// Code for auth_service
final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  final _storage = const FlutterSecureStorage();

  Future<void> checkAuth() async {
    String? token = await _storage.read(key: 'token');
    state = token != null;
  }

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://yourapi.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _storage.write(key: 'token', value: data['token']);
      state = true;
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
    state = false;
  }
}
