import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/models/questionModel.dart';
import 'package:quizz_app/services/database.dart';
import 'package:quizz_app/view/results.dart';
import 'package:quizz_app/widgets/quizPlayWidget.dart';
import 'package:quizz_app/widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {
  final String quizId;


  const PlayQuiz({Key key, @required this.quizId}) : super(key: key);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionSnapshot;

 QuestionModel getQuestionModelFromDatasnapshot(DocumentSnapshot documentSnapshot, int index){
    QuestionModel questionModel = new QuestionModel();

    questionModel.question = questionSnapshot.docs[index]["question"];

    List<String> options =[
      questionSnapshot.docs[index]["option1"],
      questionSnapshot.docs[index]["option2"],
      questionSnapshot.docs[index]["option3"],
      questionSnapshot.docs[index]["option4"],
    ];
    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];

    questionModel.correctOption = questionSnapshot.docs[index]["option1"];
    questionModel.answered = false;

    return questionModel;
  }

  @override
  void initState() {
    print("${widget.quizId}");
    databaseService.getQuestionData(widget.quizId).then((value){
      questionSnapshot = value;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      total = questionSnapshot.docs.length;
      print("$total this is total ");
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
        brightness: Brightness.light,
      ),
      body: Container(
        child: Column(
          children: [
            questionSnapshot == null ?
                Container() :
                ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: questionSnapshot.docs.length,
                  itemBuilder: (context,index){
                    return QuizPlayTile(
                      questionModel: getQuestionModelFromDatasnapshot(questionSnapshot.docs[index], index),
                      index: index,
                    );
                  },
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder:
              (context) => Results(total: total, correct: _correct, incorrect: _incorrect)));
        },
      ),
    );
  }
}
class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  const QuizPlayTile({Key key, this.questionModel, this.index}) : super(key: key);

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.index+1}Q ${widget.questionModel.question}",style: TextStyle(
            fontSize: 18,
            color: Colors.black54
          ),),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){
              if(!widget.questionModel.answered){
                if(widget.questionModel.option1 == widget.questionModel.correctOption){
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.answered = true;
                  _correct = _correct +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });
                }else{
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.answered = true;
                  _incorrect = _incorrect +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });

                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option1,
              option: "A",
              optionSelected: optionSelected,),
          ),
          SizedBox(height: 4,),
          GestureDetector(
            onTap: (){
              if(!widget.questionModel.answered){
                if(widget.questionModel.option2 == widget.questionModel.correctOption){
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.answered = true;
                  _correct = _correct +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });
                }else{
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.answered = true;
                  _incorrect = _incorrect +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });

                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option2,
              option: "B",
              optionSelected: optionSelected,),
          ),
          SizedBox(height: 4,),
          GestureDetector(
            onTap: (){
              if(!widget.questionModel.answered){
                if(widget.questionModel.option3 == widget.questionModel.correctOption){
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.answered = true;
                  _correct = _correct +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });
                }else{
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.answered = true;
                  _incorrect = _incorrect +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });

                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option3,
              option: "C",
              optionSelected: optionSelected,),
          ),
          SizedBox(height: 4,),
          GestureDetector(
            onTap: (){
              if(!widget.questionModel.answered){
                if(widget.questionModel.option4 == widget.questionModel.correctOption){
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.answered = true;
                  _correct = _correct +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });
                }else{
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.answered = true;
                  _incorrect = _incorrect +1;
                  _notAttempted = _notAttempted - 1;
                  setState(() {

                  });

                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option4,
              option: "D",
              optionSelected: optionSelected,),
          ),
          SizedBox(height: 12,),
        ],
      ),
    );
  }
}

