import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:doko_platter/app/shared_prefs/token_shared_prefs.dart';
import 'package:doko_platter/app/usecase/usease.dart';
import 'package:doko_platter/core/error/failure.dart';
import 'package:doko_platter/feature/Product/domain/repository/product_repository.dart';

class DeleteProductParams extends Equatable {
  final String productId;

  const DeleteProductParams({required this.productId});

  const DeleteProductParams.empty() : productId = '_empty.string';

  @override
  List<Object?> get props => [
        productId,
      ];
}

class DeleteProductUsecase
    implements UsecaseWithParams<void, DeleteProductParams> {
  final IProductRepository productRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteProductUsecase(
      {required this.productRepository, required this.tokenSharedPrefs});

  @override
  Future<Either<Failure, void>> call(DeleteProductParams params) async {
    //  Get token
    final token = await tokenSharedPrefs.getToken();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await productRepository.deleteProduct(params.productId, r);
    });
  }
}
