import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: DefaultTabController(
          length: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: TabBar(tabs: [
                  Tab(
                    child: Text(
                      'ALL',
                    ),
                  ),
                  Tab(text: "COURSES"),
                  Tab(text: "PATHS"),
                  Tab(text: "AUTHORS"),
                ]),
              ),
              Expanded(
                //Add this to give height

                child: TabBarView(children: [
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('Hello'),
                          SizedBox(
                            height: 200,
                          ),
                          Text('Hello'),
                          SizedBox(
                            height: 200,
                          ),
                          Text('Hello'),
                          SizedBox(
                            height: 200,
                          ),
                          Text('Hello'),
                          SizedBox(
                            height: 200,
                          ),
                          Text('Hello'),
                          SizedBox(
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Text("Articles Body"),
                  ),
                  Container(
                    child: Text("Articles Body"),
                  ),
                  Container(
                    child: Text("Articles Body"),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
