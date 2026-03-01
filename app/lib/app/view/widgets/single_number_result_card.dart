import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SingleNumberResultCard extends StatelessWidget {
  final String number;
  final bool isPerfect;
  const SingleNumberResultCard({
    required this.isPerfect,
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.surface,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            number,
            style: AppTextStyle.titleCard,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            '$number ${isPerfect ? 'é um número perfeito' : 'não é um número perfeito'}.',
            style: AppTextStyle.subTitleCard,
          ),
        ],
      ),
    );
  }
}
