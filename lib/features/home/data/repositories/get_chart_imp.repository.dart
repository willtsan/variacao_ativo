import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/features/home/data/datasources/get_chart.datasource.dart';
import 'package:variacao_ativo/features/home/domain/dto/chart_item.dto.dart';
import 'package:variacao_ativo/features/home/domain/repositories/get_chart.repository.dart';

class GetChartRepositoryImp extends GetChartRepository {
  final GetChartDatasource _chartDatasource;

  GetChartRepositoryImp(this._chartDatasource);

  @override
  Future<Either<Exception, List<ChartItemDto>>> call() =>
      _chartDatasource.call();
}
