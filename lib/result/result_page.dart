import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int questionsLength;
  final int rightAnswersLength;

  const ResultPage({
    Key? key,
    required this.title,
    required this.questionsLength,
    required this.rightAnswersLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            SizedBox(
              height: 14,
            ),
            Text('Parabéns!', style: AppTextStyles.heading40,),
            SizedBox(
              height: 14,
            ),
            Column(
              children: [
                Text('Você concluiu', style: AppTextStyles.body,),
                Text(title, style: AppTextStyles.bodyBold,),
                Text('acertando $rightAnswersLength de $questionsLength questões', style: AppTextStyles.body,),
              ],
            ),
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NextButtonWidget.purple(
                    label: 'Compartilhar',
                    onTap: () => Share.share('Obtive ${((rightAnswersLength/questionsLength)*100).round()}% de acerto no quiz "$title"'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NextButtonWidget.white(
                    label: 'Voltar para a tela inicial',
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}