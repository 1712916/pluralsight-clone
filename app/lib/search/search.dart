import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _queryController = TextEditingController();
  bool _isEnterInput = false;

  @override
  void initState() {
    super.initState();

    _queryController.addListener(() {
      if (_queryController.text == '') {
        setState(() {
          _isEnterInput = false;
        });
      } else {
        setState(() {
          _isEnterInput = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      //body thay đổi khi nhập và khi bấm search
      body: Text('This is Search'),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      title: TextField(
        controller: _queryController,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: _isEnterInput
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _queryController.clear();
                  },
                )
              : null,
        ),
      ),
    );
  }
}
