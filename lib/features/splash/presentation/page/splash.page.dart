import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "PTR4.SA",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
            const Divider(),
            const Text(
              "Um teste técnico por William Santos",
              textAlign: TextAlign.center,
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/home', arguments: {'view': 'table'});
              },
              child: const Text("Visualizar variação de preços em tabela"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/home', arguments: {'view': 'chart'});
              },
              child: const Text("Visualizar variação de preços em gráfico"),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   // This is used in the platform side to register the view.
  //   const String viewType = '<platform-view-type>';
  //   // Pass parameters to the platform side.
  //   const Map<String, dynamic> creationParams = <String, dynamic>{};

  //   return PlatformViewLink(
  //     viewType: viewType,
  //     surfaceFactory: (context, controller) {
  //       return AndroidViewSurface(
  //         controller: controller as AndroidViewController,
  //         gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
  //         hitTestBehavior: PlatformViewHitTestBehavior.opaque,
  //       );
  //     },
  //     onCreatePlatformView: (params) {
  //       return PlatformViewsService.initSurfaceAndroidView(
  //         id: params.id,
  //         viewType: viewType,
  //         layoutDirection: TextDirection.ltr,
  //         creationParams: creationParams,
  //         creationParamsCodec: const StandardMessageCodec(),
  //         onFocus: () {
  //           params.onFocusChanged(true);
  //         },
  //       )
  //         ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
  //         ..create();
  //     },
  //   );
  // }
}
