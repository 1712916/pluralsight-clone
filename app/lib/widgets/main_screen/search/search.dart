 import 'package:app/models/search-history-response-model.dart';
import 'package:app/models/search-response-model.dart';
import 'package:app/models/search-v2-response-model.dart';
import 'package:app/provider/login-provider.dart';
import 'package:app/services/course-services.dart';
import 'package:app/widgets/course_detail/detail.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:app/widgets/main_screen/search/search-result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                return CourseDetail( );

                default:
                  return   Search();
              }
            });
      },
    );
  }
}
List<HistoryContent> dataSuggestions = [
  HistoryContent(content:"Heroku"),
  HistoryContent(content:"Flutter"),
  HistoryContent(content:"Angular"),
  HistoryContent(content:"IOS"),
  HistoryContent(content:"C++"),
];

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _queryController = TextEditingController();
  bool _isTyping = false;
  Widget _body;
  bool _isSearching=false;
  String _token="";

  //recent
  List<HistoryContent> _recentSearches =[];
  List<HistoryContent> _suggestions = [];

  @override
  void initState() {
    super.initState();
    var loginStatus= Provider.of<LoginProvider>(context,listen: false);

   if(loginStatus.isLogin){
     _token=loginStatus.userResponseModel.token;
     loadRecentSearches();
   }
    _queryController.addListener(() {
      if (_isTyping) {
        if (_queryController.text == '') {
          setState(() {
            _body = _recentSearches.isEmpty ? null : _buidRecentSearches();
          });
        } else {
          //widget.search here
          List<HistoryContent> searching = [];
          searching = dataSuggestions
              .where((element) => element.content
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
  loadRecentSearches() async {
   var response=  await CourseServices.getSearchHistory(token: _token);
   var data=searchHistoryResponseModelFromJson(response.body).payload.data;
   _recentSearches=data;
   _body = _recentSearches.isEmpty ? null : _buidRecentSearches();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: _isSearching?Center(child: circleLoading(),): _body,
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
          hintText:  AppLocalizations.of(context).hintSearch,
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
                Text(AppLocalizations.of(context).recentSearch),
                TextButton(
                    onPressed: () {
                      for(int i=0;i<_recentSearches.length;i++){
                        CourseServices.deleteSearchHistory(token: _token,historyId:_recentSearches[i].id );
                      }
                      setState(() {
                        _recentSearches.clear();
                        _body = null;
                      });

                    },
                    child: Text(AppLocalizations.of(context).clearAll))
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  _recentSearches.map((str) => _itemSuggestion(str, false)).toList(),
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
              children: _suggestions.map((str) => _itemSuggestion(str, true)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void submitSearchText(String text) async {
    setState(() {
      _isSearching=true;
    });
    await Future.delayed(Duration(seconds: 1));

    var response = await CourseServices.searchV2(keyword: text,token:_token );
    setState(() {
      _isSearching=false;
    });

    var data=searchV2ResponseModelFromJson(response.body).payload;
    List<CourseSearch> courses=data.courses.data;
    List<InstructorsDatum> authors=data.instructors.data;

    setState(() {
      _recentSearches.add(HistoryContent(content: text));
      _queryController.text = text;
      _queryController.selection = TextSelection.fromPosition(
          TextPosition(offset: _queryController.text.length));


      if (courses.length != 0) {
        _body = SearchResult(courses: courses,authors: authors,);
      } else {
        _body = Center(
          child: Text(AppLocalizations.of(context).searchNotFound),
        );
      }

      _isTyping = false;
      //Tat ban phim
      FocusScope.of(context).unfocus();
    });
  }

  Widget _itemSuggestion(HistoryContent strInput,bool type) {
    return ListTile(
      title: Text(strInput.content),
      leading: type ? Icon(Icons.search) : Icon(Icons.history),
      onTap: () {
        //thay doi _body
        submitSearchText(strInput.content);
      },
      trailing: type ?null:IconButton(
        onPressed: (){
         CourseServices.deleteSearchHistory(token: _token, historyId: strInput.id);
         setState(() {
           _recentSearches.remove(strInput);
           _body = _recentSearches.isEmpty ? null : _buidRecentSearches();
         });
        },
        icon: Icon(Icons.delete),
      ),
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
