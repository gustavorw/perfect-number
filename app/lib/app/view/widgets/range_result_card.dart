import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RangeResultCard extends StatelessWidget {
  final String start;
  final String end;
  final List<BigInt> perfects;
  const RangeResultCard({
    required this.start,
    required this.end,
    required this.perfects,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.surface,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entre o número $start até $end temos:',
            style: AppTextStyle.titleCard,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          if(perfects.isNotEmpty)
          Text(
            '${convert(perfects)}\n',
            style: AppTextStyle.subTitleCard,
            textAlign: TextAlign.start,
          ),
          if(perfects.isEmpty)
          Text(
            'Não possui número perfeito nesse intervalo',
            style: AppTextStyle.subTitleCard,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

String convert(List<BigInt> perfects) {
  String result = '';
  for (var i = 0; i < perfects.length; i++) {
    final number = '${i + 1}º - ${perfects[i].toString()}\n';
    result += number;
  }
  return result;
}
