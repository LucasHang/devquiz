import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
      name: "Lucas",
      photoUrl: "https://avatars.githubusercontent.com/u/38769565?v=4",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
        title: "NLW #05 Flutter", 
        questions: [
          QuestionModel(
            title: "Eai, bom?",
            answers: [
              AnswerModel(
                title: "Sim",
                isRight: true,
              ),
              AnswerModel(
                title: "Não",
              ),
              AnswerModel(
                title: "Sim-Não",
              ),
              AnswerModel(
                title: "Não-Sim",
              )
            ]
          ),
          QuestionModel(
            title: "Eai, ruim?",
            answers: [
              AnswerModel(
                title: "Sim",
                isRight: true,
              ),
              AnswerModel(
                title: "Não",
              ),
              AnswerModel(
                title: "Sim-Não",
              ),
              AnswerModel(
                title: "Não-Sim",
              )
            ]
          )
        ], 
        imagem: AppImages.blocks, 
        level: Level.facil,
        questionAnswered: 1,
      )
    ];
  }
}