import 'package:flutter/material.dart';
import 'package:masjid_pro/app/data/models/statistic.dart';
import 'package:masjid_pro/app/utils/app_size.dart';
import 'package:masjid_pro/app/utils/styles/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppColumnBarChart extends StatelessWidget {
  final List<Statistic> dataSource;
  final String legendItemText;
  final double width;

  const AppColumnBarChart({
    Key key,
    this.dataSource,
    this.legendItemText,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? AppSize.widthScreen(context) / 2 - 16,
      height: 250,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: SfCartesianChart(
        legend: Legend(
          isVisible: true,
          isResponsive: true,
        ),
        primaryXAxis: CategoryAxis(
          name: legendItemText,
          labelIntersectAction: AxisLabelIntersectAction.wrap,
          labelPosition: ChartDataLabelPosition.outside,
          labelStyle: TextStyle(color: Colors.black),
        ),
        series: <ColumnSeries<Statistic, String>>[
          ColumnSeries<Statistic, String>(
            dataSource: dataSource,
            xValueMapper: (data, _) => data.namaStatistik,
            yValueMapper: (data, _) => int.parse(data.value),
            width: 0.5,
            enableTooltip: true,
            color: AppColors.grayColor,
            isVisible: true,
            legendItemText: legendItemText,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6.0),
              topLeft: Radius.circular(6.0),
            ),
          )
        ],
      ),
    );
  }
}
