import "package:flutter/material.dart";

class Question extends StatelessWidget {
    final String text;

    Question(this.text);

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Text(
                text,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
            ),
        );
    }
}