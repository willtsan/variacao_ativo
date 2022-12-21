import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/features/home/domain/dto/chart_item.dto.dart';

abstract class GetChartUsecase {
  Future<Either<Exception, List<ChartItemDto>>> call();
}
