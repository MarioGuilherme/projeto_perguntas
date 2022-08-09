import "package:flutter/material.dart";

class Result extends StatelessWidget {
    final int totalScore;
    final void Function() restartQuiz;

    Result(this.totalScore, this.restartQuiz);

    String get resultPhrase {
        if (totalScore < 8)
            return "Parabéns";

        if (totalScore < 12)
            return "Você é bom";

        if (totalScore < 16)
            return "Impressionate";

        return "Nível Jedi!";
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Center(
                    child: Text(
                        resultPhrase,
                        style: const TextStyle(fontSize: 20),
                    )
                ),
                ElevatedButton(
                    onPressed: restartQuiz,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                    ),
                    child: const Text("Reiniciar"),
                )
            ],
        );
    }
}