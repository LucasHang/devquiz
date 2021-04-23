import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final int value;

  const ChartWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 68,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 68,
              width: 68,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: value/100,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),

          Center(
            child: Text("$value%", style: AppTextStyles.heading),
          )
        ],
      ),
    );
  }
}