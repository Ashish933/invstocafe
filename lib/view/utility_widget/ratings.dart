import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _rating = 1;
            });
          },
          child: Icon(
            _rating >= 1 ? Icons.star : Icons.star_border,
            size: 20,
            color: Colors.amberAccent,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _rating = 2;
            });
          },
          child: Icon(
            _rating >= 2 ? Icons.star : Icons.star_border,
            size: 20,

            color: Colors.amberAccent,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _rating = 3;
            });
          },
          child: Icon(
            _rating >= 3 ? Icons.star : Icons.star_border,
            color: Colors.amberAccent,
            size: 20,

          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _rating = 4;
            });
          },
          child: Icon(
            _rating >= 4 ? Icons.star : Icons.star_border,
            color: Colors.amberAccent,
            size: 20,

          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _rating = 5;
            });
          },
          child: Icon(
            _rating >= 5 ? Icons.star : Icons.star_border,
            color: Colors.amberAccent,
            size: 20,

          ),
        ),
      ],
    );
  }
}
