import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: AppGradients.linear
            ),
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Fala, ",
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: "Lucas!",
                        style: AppTextStyles.titleBold,
                      )
                    ]
                  )
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://avatars.githubusercontent.com/u/38769565?v=4"
                      )
                    )
                  ),
                )
              ],
            ), 
          ),

          Align(
            alignment: Alignment(0.0, 1.1),
            child: ScoreCardWidget(),
          )
        ]
      )
    ),
  );
}