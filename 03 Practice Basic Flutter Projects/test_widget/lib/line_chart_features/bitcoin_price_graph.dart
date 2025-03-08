import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_widget/line_chart_features/transformationbuttons.dart';

import 'apputils.dart';
import 'charttitle.dart';

class BitcoinPriceGraph extends StatefulWidget {
  const BitcoinPriceGraph({super.key});

  @override
  State<BitcoinPriceGraph> createState() => _BitcoinPriceGraphState();
}

class _BitcoinPriceGraphState extends State<BitcoinPriceGraph> {
  List<(DateTime, double)>? _bitcoinPriceHistory;
  late TransformationController _transformationController;

  bool _isPanEnabled = true;
  bool _isScaleEnabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transformationController = TransformationController();
    _reloadData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _transformationController.dispose();
    super.dispose();
  }

  void _reloadData() async {
    final dataStr = await rootBundle.loadString(
      'assets/data/btc_last_year_price.json',
    );
    final json = jsonDecode(dataStr) as Map<String, dynamic>;

    setState(() {
      _bitcoinPriceHistory =
          (json['prices'] as List).map((item) {
            final timestamp = item[0] as int;
            final price = item[1] as double;
            return (DateTime.fromMillisecondsSinceEpoch(timestamp), price);
          }).toList();
    });

    // print(dataStr);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    print("Width x height : $width x $height");

    const leftReservedSize = 52.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bitcon Price graph',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16.h,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final width = constraints.maxWidth;
                return width >= 380
                    ? Row(
                      children: [
                        SizedBox(width: leftReservedSize.w),
                        ChartTitle(),
                        Spacer(),
                        Center(
                          child: Transformationbuttons(
                            controller: _transformationController,
                          ),
                        ),
                        SizedBox(width: 20.sp),
                      ],
                    )
                    : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChartTitle(),
                          SizedBox(height: 16.sp),
                          Transformationbuttons(
                            controller: _transformationController,
                          ),
                        ],
                      ),
                    );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 16,
                children: [
                  Text('Pan', style: TextStyle(fontSize: 16.sp)),
                  Switch(
                    value: _isPanEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isPanEnabled = value;
                      });
                    },
                  ),
                  Text('Scale', style: TextStyle(fontSize: 16.sp)),
                  Switch(
                    value: _isScaleEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isScaleEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: (16/9),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0.0,
                  right: 18.0,
                ),
                child: LineChart(

                  transformationConfig: FlTransformationConfig(
                    scaleAxis: FlScaleAxis.horizontal,
                    minScale: 1.0,
                    maxScale: 25.0,
                    panEnabled: _isPanEnabled,
                    scaleEnabled: _isScaleEnabled,
                    transformationController: _transformationController,
                  ),
                  LineChartData(
                    backgroundColor: Colors.black,
                    lineBarsData: [
                      LineChartBarData(
                        spots: _bitcoinPriceHistory?.asMap().entries.map((e) {
                          final index = e.key;
                          final item = e.value;
                          final value = item.$2;
                          return FlSpot(index.toDouble(), value);
                        }).toList() ??
                            [],
                        dotData: const FlDotData(show: false),
                        color: Colors.yellow,
                        barWidth: 1,
                        shadow:  Shadow(
                          color: Colors.yellow,
                          blurRadius: 2.sp,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellow.withValues(alpha: 0.2),
                              Colors.yellow.withValues(alpha: 0.0),
                            ],
                            stops: const [0.5, 1.0],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchSpotThreshold: 5.sp,
                      getTouchLineStart: (_, __) => -double.infinity,
                      getTouchLineEnd: (_, __) => double.infinity,
                      getTouchedSpotIndicator:
                          (LineChartBarData barData, List<int> spotIndexes) {
                        return spotIndexes.map((spotIndex) {
                          return TouchedSpotIndicatorData(
                            const FlLine(
                              color: Colors.red,
                              strokeWidth: 1.5,
                              dashArray: [8, 2],
                            ),
                            FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) {
                                return FlDotCirclePainter(
                                  radius: 6.w,
                                  color: Colors.yellow,
                                  strokeWidth: 0,
                                  strokeColor: Colors.yellow,
                                );
                              },
                            ),
                          );
                        }).toList();
                      },
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                          return touchedBarSpots.map((barSpot) {
                            final price = barSpot.y;
                            final date =
                                _bitcoinPriceHistory![barSpot.x.toInt()].$1;
                            return LineTooltipItem(
                              '',
                              const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '${date.year}/${date.month}/${date.day}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n${AppUtils.getFormattedCurrency(
                                    context,
                                    price,
                                    noDecimals: true,
                                  )}',
                                  style:  TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            );
                          }).toList();
                        },
                        getTooltipColor: (LineBarSpot barSpot) =>
                        Colors.black,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: const AxisTitles(
                        drawBelowEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: leftReservedSize,
                          maxIncluded: false,
                          minIncluded: false,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 38,
                          maxIncluded: false,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            final date = _bitcoinPriceHistory![value.toInt()].$1;
                            return SideTitleWidget(
                              meta: meta,
                              child: Transform.rotate(
                                angle: -45 * 3.14 / 180,
                                child: Text(
                                  '${date.month}/${date.day}',
                                  style:  TextStyle(
                                    color: Colors.green,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  duration: Duration.zero,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
