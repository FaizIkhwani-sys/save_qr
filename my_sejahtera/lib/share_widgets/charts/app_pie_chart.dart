import 'package:flutter/material.dart';
import 'package:masjid_pro/app/data/models/statistic.dart';
import 'package:masjid_pro/app/utils/app_size.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppPieChart extends StatelessWidget {
  final List<Statistic> dataSource;
  final String chartTitle;

  const AppPieChart({
    Key key,
    this.dataSource,
    this.chartTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context) / 2 - 16,
      height: 250,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: SfCircularChart(
        title: ChartTitle(
          text: chartTitle,
          textStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        legend: Legend(
          isVisible: true,
        ),
        series: <DoughnutSeries<Statistic, String>>[
          DoughnutSeries<Statistic, String>(
            dataSource: dataSource,
            xValueMapper: (data, _) => data.value,
            yValueMapper: (data, _) => int.parse(data.value),
            dataLabelMapper: (data, _) => data.namaStatistik,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(
                color: Colors.black54,
                fontSize: 12.0,
              ),
            ),
            selectionBehavior: SelectionBehavior(
              enable: true,
            ),
          ),
        ],
      ),
    );
  }
}
