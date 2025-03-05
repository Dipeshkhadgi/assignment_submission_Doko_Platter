import 'package:flutter_test/flutter_test.dart';
import 'package:doko_platter/core/network/hive_service.dart';
import 'package:doko_platter/feature/Order/data/data_source/order_data_source.dart';
import 'package:doko_platter/feature/Order/domain/entity/order_entity.dart';
import 'package:doko_platter/feature/order/data/model/order_hive_model.dart';

class OrderLocalDataSource implements IOrderDataSource {
  final HiveService hiveService;

  OrderLocalDataSource({required this.hiveService});

  @override
  Future<void> createOrder(OrderEntity order) async {
    try {
      // Convert ProductEntity to ProductHiveModel
      final orderHiveModel = OrderHiveModel.fromEntity(order);
      await hiveService.addOrder(orderHiveModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteOrder(String id) async {
    try {
      await hiveService.deleteOrder(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<OrderEntity>> getOrder(String? token, String userId) async {
    try {
      return hiveService.getOrder(userId).then(
        (value) {
          return value.map((e) => e.toEntity()).toList();
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
