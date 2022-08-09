import "package:flutter/material.dart";
import "question.dart";
import "answer.dart";

class Quiz extends StatelessWidget {
    final List<Map<String, Object>> questions;
    final int selectedQuestion;

    final void Function(int) answerFn;

    Quiz({
        required this.questions,
        required this.selectedQuestion,
        required this.answerFn
    });

    bool get hasQuestionSelected => selectedQuestion < questions.length;

    @override
    Widget build(BuildContext context) {
        List<Map<String, Object>> answers = hasQuestionSelected ? questions[selectedQuestion].cast()["answers"] : [];

        return Column(
            children: <Widget>[
                Question(
                    questions[selectedQuestion]["text"].toString()
                ),
                ...answers.map(
                    (answer) => Answer(
                        answer["text"].toString(),
                        () => answerFn(int.parse(answer["score"].toString()))
                    )
                ).toList()
            ]
        );
    }
}