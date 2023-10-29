import '../utils/resource.dart';

abstract class AuthRepository {
  Future<Resource> login({required String email, String password});
}