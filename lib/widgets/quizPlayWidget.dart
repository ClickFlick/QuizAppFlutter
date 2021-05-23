import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;

  const OptionTile(
      {Key key,
      @required this.correctAnswer,
      @required this.description,
      @required this.optionSelected,
      @required this.option})
      : super(key: key);

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.description == widget.optionSelected
                    ? widget.optionSelected == widget.correctAnswer
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.black54,
                width: 1.5
                
              ),
              borderRadius: BorderRadius.circular(30)
            ),
            alignment: Alignment.center,
            child: Text(
              "${widget.option}",
              style: TextStyle(
                color: widget.optionSelected == widget.description
                    ? widget.correctAnswer == widget.optionSelected
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red
                    : Colors.black54,
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            widget.description,
            style: TextStyle(fontSize: 17, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
