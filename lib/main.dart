import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variacao_ativo/features/home/data/datasources/get_chart.datasource.dart';
import 'package:variacao_ativo/features/home/data/datasources/get_chart_imp.datasource.dart';
import 'package:variacao_ativo/features/home/data/repositories/get_chart_imp.repository.dart';
import 'package:variacao_ativo/features/home/domain/repositories/get_chart.repository.dart';
import 'package:variacao_ativo/features/home/domain/usecases/get_chart.usecase.dart';
import 'package:variacao_ativo/features/home/domain/usecases/get_chart_imp.usecase.dart';
import 'package:variacao_ativo/features/home/presentation/controller/home.controller.dart';
import 'package:variacao_ativo/features/home/presentation/page/home.page.dart';
import 'package:variacao_ativo/features/splash/presentation/page/splash.page.dart';

void main() {
  registerDependencies();

  runApp(const MyApp());
}

void registerDependencies() {
  Get.put<GetChartDatasource>(GetChartDatasourceImp());
  Get.put<GetChartRepository>(GetChartRepositoryImp(Get.find()));
  Get.put<GetChartUsecase>(GetChartUseCaseImp(Get.find()));

  Get.put<HomeController>(HomeController(Get.find()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gráfico PETR4.SA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => HomePage(
              controller: Get.find(),
            ),
      },
      initialRoute: '/',
    );
  }
}
