import 'package:flutter/material.dart';

class TextExpandable extends StatefulWidget {
  final String strText;
  static const int defaultLength = 15;

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
    _content = widget.strText;
    print(_content);
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
                  style: TextStyle(
                    color: Colors.black,
                  ),
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
                      int index=TextExpandable.defaultLength;
                      while(true){
                        if(widget.strText[index]!=' '){
                          index--;

                        }else{
                          break;
                        }
                      }
                      _content =
                          widget.strText.substring(0,index );
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Center(
                    child: !_isExpanded
                        ? Icon(Icons.keyboard_arrow_down)
                        : Icon(Icons.keyboard_arrow_up),
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


