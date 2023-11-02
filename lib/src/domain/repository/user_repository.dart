import 'dart:io';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import '../utils/resource.dart';

abstract class UserRepository {
  Stream<Resource<UserData>> getUserById(String id);
  Future<Resource<String>> updateWithoutImage(UserData userData);
  Future<Resource<String>> updateWithImage(UserData userData, File image);
}