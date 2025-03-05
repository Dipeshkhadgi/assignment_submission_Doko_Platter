import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doko_platter/core/error/failure.dart';
import 'package:doko_platter/feature/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerCustomer(AuthEntity customer);

  Future<Either<Failure, String>> loginCustomer(
      String username, String password);

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser(
      String? token, String userID);
  Future<Either<Failure, AuthEntity>> updateUser(AuthEntity user);
}
