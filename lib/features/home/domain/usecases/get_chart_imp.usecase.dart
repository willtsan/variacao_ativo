import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/features/home/domain/dto/chart_item.dto.dart';
import 'package:variacao_ativo/features/home/domain/repositories/get_chart.repository.dart';
import 'package:variacao_ativo/features/home/domain/usecases/get_chart.usecase.dart';

class GetChartUseCaseImp extends GetChartUsecase {
  final GetChartRepository _chartRepository;

  GetChartUseCaseImp(this._chartRepository);

  @override
  Future<Either<Exception, List<ChartItemDto>>> call() =>
      _chartRepository.call();
}
