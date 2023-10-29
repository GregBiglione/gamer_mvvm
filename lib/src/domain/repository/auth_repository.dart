import '../utils/resource.dart';

abstract class AuthRepository {
  Future<Resource> login({required String email, required String password});
}