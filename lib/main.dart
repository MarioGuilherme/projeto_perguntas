import "package:flutter/material.dart";
import "quiz.dart";
import "result.dart";

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
    int _selectedQuestion = 0;
    int _totalScore = 0;
    final List<Map<String, Object>> _questions = const [{
        "text": "Qual é a sua cor favorita?",
        "answers": [
            { "text": "Preto", "score": 10 },
            { "text": "Vermelho", "score": 5 },
            { "text": "Verde", "score": 3 },
            { "text": "Branco", "score": 1 }
        ]
    }, {
        "text": "Qual é o seu animal favorito?",
        "answers": [
            { "text": "Gato", "score": 10 },
            { "text": "Leão", "score": 5 },
            { "text": "Cobra", "score": 3 },
            { "text": "Elefante", "score": 1 }
        ]
    }, {
        "text": "Qual é o seu instrutor favorito?",
        "answers": [
            { "text": "Leo", "score": 10 },
            { "text": "Maria", "score": 5 },
            { "text": "João", "score": 3 },
            { "text": "Pedro", "score": 1 }
        ]
    }];

    void _answer(int score) => {
        if (hasQuestionSelected)
            setState(() {
                _selectedQuestion++;
                _totalScore += score;
            })
    };

    void _restartQuiz() => setState(() {
        _selectedQuestion = 0;
        _totalScore = 0;
    });

    bool get hasQuestionSelected => _selectedQuestion < _questions.length;

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                    title: const Text("Perguntas"),
                ),
                body: hasQuestionSelected
                ? Quiz(
                    questions: _questions,
                    selectedQuestion: _selectedQuestion,
                    answerFn: _answer,
                ) : Result(_totalScore, _restartQuiz)
            ),
        );
    }
}

class PerguntaApp extends StatefulWidget {
    _PerguntaAppState createState() => _PerguntaAppState();
}