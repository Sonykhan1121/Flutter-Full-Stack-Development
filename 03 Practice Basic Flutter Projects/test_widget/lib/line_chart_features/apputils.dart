import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String getFormattedCurrency(BuildContext context, double value, {bool noDecimals = false}) {
    final format = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(), // Get locale from context
      symbol: '\$', // Replace with proper symbol if needed
      decimalDigits: noDecimals ? 0 : 2, // Hide decimals if 'noDecimals' is true
    );
    return format.format(value);
  }
}
