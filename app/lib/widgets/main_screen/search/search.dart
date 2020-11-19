import 'package:app/widgets/main_screen/search/search-result.dart';
import 'package:flutter/material.dart';

List<String> dataSuggestions = [
  "Android",
  "Heroku",
  "Flutter",
  "Angular",
  "IOS",
  "C++",
  "C#",
  "Python",
  "Dart",
  "Nodejs",
  "React native",
];

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _queryController = TextEditingController();
  bool _isTyping = false;

  Widget _body;

  //recent
  List<String> _recentSearches = ["Android", "Heroku", "Flutter"];
  List<String> _suggestions = [
    "Android",
    "Heroku",
    "Flutter",
    "Angular",
    "IOS",
    "C++",
    "C#",
    "Python",
    "Dart",
    "Nodejs",
    "React native",
  ];

  @override
  void initState() {
    super.initState();
    _body = _recentSearches.isEmpty ? null : _buidRecentSearches();
    _queryController.addListener(() {
      if(_isTyping){
        if (_queryController.text == '') {
          setState(() {
            _body = _recentSearches.isEmpty ? null : _buidRecentSearches();
          });
        } else {
          //widget.search here
          List<String> searching = [];
          searching = dataSuggestions
              .where((element) => element.contains(_queryController.text))
              .toList();
          setState(() {

            _suggestions.clear();
            _suggestions = searching;
            _body = _buidSuggestions();
          });
        }
      }
      if(!_isTyping){
        setState(() {
          _isTyping=true;
        });
      }




    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      //body thay đổi khi nhập và khi bấm widget.search
      body: _body,
    );
  }

  AppBar _AppBar() {
    return AppBar(
      title: TextField(
        controller: _queryController,
        decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintText: 'Search...',
          suffixIcon: _queryController.text !=''
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

  Widget _buidRecentSearches() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent searches"),
                TextButton(
                    onPressed: () {
                      print("Hello");
                      setState(() {
                        _recentSearches.clear();
                        _body = null;
                      });
                      print("SIZE of recent: ${_recentSearches.length}");
                    },
                    child: Text("Clear"))
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  _recentSearches.map((str) => _item(str, false)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buidSuggestions() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: _suggestions.map((str) => _item(str, true)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(strInput, type) {
    return ListTile(
      title: Text(strInput),
      leading: type ? Icon(Icons.search) : Icon(Icons.history),
      onTap: () {
        _recentSearches.add(strInput);
        //thay doi _body
        setState(() {
         _queryController.text = strInput;
         _queryController.selection=TextSelection.fromPosition(TextPosition(offset: _queryController.text.length));
          _body = SearchResult();
          _isTyping=false;
          //Tat ban phim
          FocusScope.of(context).unfocus();
        });
      },
    );
  }
}
