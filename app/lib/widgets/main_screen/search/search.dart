import 'package:app/models/courses-response-model.dart';
import 'package:app/models/search-response-model.dart';
import 'package:app/services/course-services.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/main_screen/search/search-result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/data.dart';
class SupperSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Navigator(
      onGenerateRoute: (RouteSettings settings) {

        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/':
                  return  Search();
               case CourseDetail.routeName:
                return CourseDetail(null);

                default:
                  return   Search();
              }
            });
      },
    );
  }
}
List<String> dataSuggestions = [
  "data",
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
    "data",
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
      if (_isTyping) {
        if (_queryController.text == '') {
          setState(() {
            _body = _recentSearches.isEmpty ? null : _buidRecentSearches();
          });
        } else {
          //widget.search here
          List<String> searching = [];
          searching = dataSuggestions
              .where((element) => element
                  .toLowerCase()
                  .contains(_queryController.text.toLowerCase()))
              .toList();
          setState(() {
            _suggestions.clear();
            _suggestions = searching;
            _body = _buidSuggestions();
          });
        }
      }
      if (!_isTyping) {
        setState(() {
          _isTyping = true;
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
        onSubmitted: submitSearchText,
        decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintText: 'Search...',
          suffixIcon: _queryController.text != ''
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

  void submitSearchText(String text) async {
    var response = await CourseServices.search(keyword: text);

    List<SearchItem> courses=searchResponseModelFromJson(response.body).payload.rows;


    print("submit search :$text");
    setState(() {
      _recentSearches.add(text);
      _queryController.text = text;
      _queryController.selection = TextSelection.fromPosition(
          TextPosition(offset: _queryController.text.length));

      //Tìm kiếm
      //List<Course> courses=Provider.of<CourseProvider>(context).findCoursesByTitle(_queryController.text);
      //   List<Path> paths=Paths;
//      List<Author> authors=Authors;

      if (courses.length != 0) {
        _body = SearchResult(courses: courses);
      } else {
        _body = Center(
          child: Text("Không tìm thấy khóa học"),
        );
      }

      _isTyping = false;
      //Tat ban phim
      FocusScope.of(context).unfocus();
    });
  }

  Widget _item(strInput, type) {
    return ListTile(
      title: Text(strInput),
      leading: type ? Icon(Icons.search) : Icon(Icons.history),
      onTap: () {
        //thay doi _body
        submitSearchText(strInput);
      },
    );
  }

  // void submit(String text, BuildContext context) async{
  //   //List<Course> courses=Provider.of<CourseProvider>(context).findCoursesByTitle(text);
  //   // List<Path> paths=Paths;
  //   // List<Author> authors=Authors;
  //   var response=await CourseServices.search(keyword: text);
  //   List<Course> courses= coursesResponseModelFromJson(response.body).courses;
  //   setState(){
  //     if(courses.length!=0){
  //       _body = SearchResult(courses: courses);
  //     }else{
  //       _body=Center( child: Text("Không tìm thấy khóa học"),);
  //     }
  //   }
  //
  // }
}
