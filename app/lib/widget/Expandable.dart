import 'package:flutter/material.dart';

class TextExpandable extends StatefulWidget {
  final String strText;
  static const int defaultLength = 130;

  TextExpandable(this.strText);

  @override
  _TextExpandableState createState() => _TextExpandableState();
}

class _TextExpandableState extends State<TextExpandable> {
  String _content = '';
  bool _isExpanded = false;
  double _height;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _content = widget.strText.substring(0,TextExpandable.defaultLength)+'...';
    _isExpanded = false;
    _height = 150;
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  _content,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                    if (_isExpanded) {
                      _content = widget.strText;

                    } else {
                      _content =  widget.strText.substring(0,TextExpandable.defaultLength ) +'...';

                    }

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Center(
                    child: _isExpanded
                        ? Icon(Icons.keyboard_arrow_up)
                        : Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


