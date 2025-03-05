import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:doko_platter/app/app.dart';
import 'package:doko_platter/app/di/di.dart';
import 'package:doko_platter/core/network/hive_service.dart';
import 'package:doko_platter/feature/Product/data/model/product_hive_model.dart';
import 'package:doko_platter/feature/auth/data/model/auth_hive_model.dart';
import 'package:doko_platter/feature/order/data/model/order_hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(AuthHiveModelAdapter());
  Hive.registerAdapter(ProductHiveModelAdapter());
  Hive.registerAdapter(OrderHiveModelAdapter());
  await HiveService().init();
  await initDependencies();

  runApp(
    const MyApp(),
  );
}
