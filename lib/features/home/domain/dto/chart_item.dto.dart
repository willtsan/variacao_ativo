class ChartItemDto {
  final double value;
  final DateTime date;

  ChartItemDto(this.date, this.value);

  factory ChartItemDto.fromJson(Map<String, dynamic> json) => ChartItemDto(
        json['date'],
        json['value'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "date": date,
        "value": value,
      };
}
