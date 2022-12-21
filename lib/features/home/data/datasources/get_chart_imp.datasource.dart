import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:variacao_ativo/features/home/data/datasources/get_chart.datasource.dart';
import 'package:variacao_ativo/features/home/domain/dto/chart_item.dto.dart';

class GetChartDatasourceImp extends GetChartDatasource {
  @override
  Future<Either<Exception, List<ChartItemDto>>> call() async {
    try {
      Response request = await Dio()
          .get('https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA');

      if (request.statusCode != 200) {
        return Left<Exception, List<ChartItemDto>>(
            Exception(request.statusMessage));
      } else {
        List<ChartItemDto> items = [];
        List<int> timestamps = [];
        List<double> opens = [];

        for (var timestamp in request.data['chart']['result'][0]['timestamp']) {
          timestamp != null ? timestamps.add(timestamp) : null;
        }

        for (var open in request.data['chart']['result'][0]['indicators']
            ['quote'][0]['open']) {
          open != null ? opens.add(open) : null;
        }

        timestamps.length > 30
            ? timestamps.removeRange(0, timestamps.length - 30)
            : null;
        opens.length > 30 ? opens.removeRange(0, opens.length - 30) : null;

        for (var i = 0; i < timestamps.length; i++) {
          items.add(
            ChartItemDto(
                DateTime.fromMillisecondsSinceEpoch(timestamps[i] * 1000)
                    .subtract(const Duration(hours: 3)),
                opens[i]),
          );
        }

        return Right<Exception, List<ChartItemDto>>(items);
      }
    } catch (e) {
      return Left<Exception, List<ChartItemDto>>(Exception(e.toString()));
    }
  }
}
