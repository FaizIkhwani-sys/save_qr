import 'package:flutter/material.dart';
import 'package:masjid_pro/app/data/models/statistic.dart';
import 'package:masjid_pro/app/utils/app_size.dart';
import 'package:masjid_pro/app/utils/styles/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppBarChart extends StatelessWidget {
  final List<Statistic> dataSource;
  final String legendItemText;
  final double height;

  const AppBarChart({
    Key key,
    this.dataSource,
    this.legendItemText,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context) / 2 - 16,
      height: height,
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
          labelPosition: ChartDataLabelPosition.inside,
          labelStyle: TextStyle(color: Colors.black),
        ),
        series: <BarSeries<Statistic, String>>[
          BarSeries<Statistic, String>(
            dataSource: dataSource,
            xValueMapper: (statistic, _) {
              return '${statistic.namaStatistik} (${statistic.value})';
            },
            yValueMapper: (statistic, _) => int.parse(statistic.value),
            width: 0.5,
            enableTooltip: true,
            color: AppColors.grayColor,
            isVisible: true,
            dataLabelMapper: (statistic, index) => statistic.value,
            legendItemText: legendItemText ?? '',
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6.0),
              bottomRight: Radius.circular(6.0),
            ),
          )
        ],
      ),
    );
  }
}
