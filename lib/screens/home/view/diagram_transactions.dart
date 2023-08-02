import 'package:blocs/blocs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DiagramTransactions extends StatelessWidget {
  const DiagramTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeInitState) {
        return _buildLegendDefaultChart(
          listWithdrawal: state.listWithdrawal,
          listReplenishment: state.listReplenishment,
          listTranslation: state.listTranslation,
        );
      } else {
        return const SizedBox();
      }
    });
  }

  SfCircularChart _buildLegendDefaultChart({
    required List<TransactionDataModel> listWithdrawal,
    required List<TransactionDataModel> listReplenishment,
    required List<TransactionDataModel> listTranslation,
  }) {
    return SfCircularChart(
      title: ChartTitle(text: 'Диаграмма (Donut)'),
      legend: const Legend(
        isVisible: true,
      ),
      series: _getLegendDefaultSeries(
        listWithdrawal: listWithdrawal,
        listReplenishment: listReplenishment,
        listTranslation: listTranslation,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getLegendDefaultSeries({
    required List<TransactionDataModel> listWithdrawal,
    required List<TransactionDataModel> listReplenishment,
    required List<TransactionDataModel> listTranslation,
  }) {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(
            title: 'перевод',
            count: listTranslation.length,
          ),
          ChartSampleData(
            title: 'пополнение',
            count: listReplenishment.length,
          ),
          ChartSampleData(
            title: 'снятие',
            count: listWithdrawal.length,
          ),
        ],
        xValueMapper: (ChartSampleData data, _) => data.title,
        yValueMapper: (ChartSampleData data, _) => data.count,
        startAngle: 90,
        endAngle: 90,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
        ),
      ),
    ];
  }
}
