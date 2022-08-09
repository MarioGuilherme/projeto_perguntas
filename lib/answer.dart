import "package:flutter/material.dart";

class Answer extends StatelessWidget {
    final String text;
    final void Function() onSelect;

    Answer(this.text, this.onSelect);

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: const TextStyle(
                        color: Colors.white
                    ),
                ),
                onPressed: onSelect,
                child: Text(text),
            ),
        );
    }
}