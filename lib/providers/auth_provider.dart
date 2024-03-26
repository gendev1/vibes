import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibes/services/auth_service.dart';

final authProvider = Provider<AuthService>((ref) => AuthService());
