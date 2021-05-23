import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final int correct, total, incorrect;

  const Results(
      {Key key,
      @required this.total,
      @required this.correct,
      @required this.incorrect})
      : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.correct}/${widget.incorrect}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "You answered ${widget.correct} answers correctly! and ${widget.incorrect} answers incorrectly",
              style: TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.center,
            )
          ],
        )),
      ),
    );
  }
}
