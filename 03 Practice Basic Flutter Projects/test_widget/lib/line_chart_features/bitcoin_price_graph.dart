import 'package:flutter/material.dart';

class BitcoinPriceGraph extends StatefulWidget {
  const BitcoinPriceGraph({super.key});

  @override
  State<BitcoinPriceGraph> createState() => _BitcoinPriceGraphState();
}

class _BitcoinPriceGraphState extends State<BitcoinPriceGraph> {
  List<(DateTime,double)>? _bitcoinPriceHistory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
