import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variacao_ativo/features/home/presentation/component/chart.component.dart';
import 'package:variacao_ativo/features/home/presentation/component/table.component.dart';
import 'package:variacao_ativo/features/home/presentation/controller/home.controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late String view;

  @override
  void initState() {
    super.initState();
    widget.controller.getData();

    view = Get.arguments['view'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PETR4.SA"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (widget.controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (widget.controller.isError.value) {
              return _buildError();
            } else {
              return _buildBody();
            }
          }
        },
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 56),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              widget.controller.errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              widget.controller.getData();
            },
            child: const Text(
              "Tentar Novamente",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "PETR4.SA",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Rentabilidade: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text:
                            '${widget.controller.profitability.toStringAsFixed(2)}%',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: widget.controller.profitability >= 0.0
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: view == 'chart' ? 2 : 4,
            child: view == 'chart'
                ? ChartComponent(controller: Get.find())
                : TableComponent(controller: Get.find()),
          ),
          view == 'chart'
              ? const Expanded(
                  flex: 1,
                  child: SizedBox.shrink(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
