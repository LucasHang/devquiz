import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() { 
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    if( controller.state == HomeState.succes ){
      return Scaffold(
      appBar: AppBarWidget(user: controller.user!,),
      body: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 6,
              spacing: 6,
              children: [
                LevelButtonWidget(label: "Fácil",),
                LevelButtonWidget(label: "Médio",),
                LevelButtonWidget(label: "Difícil",),
                LevelButtonWidget(label: "Perito",),
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
              children: controller.quizzes!.map((e) => QuizCardWidget(
                title: e.title,
                questionsLength: e.questions.length,
                questionsAnsweredLength: e.questionsAnswered,
                imageName: e.imagem,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChallengePage(
                        questions: e.questions,
                        title: e.title,
                      ),
                    )
                  );
                },
              )).toList(),
            ),
          ),
        ],
      ),
    );
    }else{
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
          )
        ),
      );
    }
  }
}