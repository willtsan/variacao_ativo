import 'package:get/get.dart';
import 'package:variacao_ativo/features/home/domain/dto/chart_item.dto.dart';
import 'package:variacao_ativo/features/home/domain/usecases/get_chart.usecase.dart';

class HomeController extends GetxController {
  final GetChartUsecase _getChartUsecase;

  HomeController(this._getChartUsecase);

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxDouble profitability = 0.0.obs;
  RxList<ChartItemDto> items = <ChartItemDto>[].obs;

  String errorMessage = '';

  void setIsLoading(value) => isLoading.value = value;

  void setIsError(value) => isError.value = value;

  Future<void> getData() async {
    setIsLoading(true);
    setIsError(false);

    items.clear();

    var req = await _getChartUsecase();

    req.fold((l) {
      errorMessage = l.toString();
      setIsLoading(false);
      setIsError(true);
    }, (r) {
      items.addAll(r);
      calculeProfitability();
      setIsLoading(false);
      setIsError(false);
    });
  }

  void calculeProfitability() {
    double first = double.parse(items.first.value.toStringAsFixed(2));
    double last = double.parse(items.last.value.toStringAsFixed(2));

    profitability.value = ((last * 100) / first) - 100;
  }
}
