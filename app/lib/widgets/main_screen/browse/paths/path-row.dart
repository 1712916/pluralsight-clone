import 'package:app/models/data.dart';
import 'package:app/utils/constain.dart';
import 'package:app/widgets/main_screen/browse/paths/path-item.dart';
import 'package:app/widgets/main_screen/browse/paths/seeall.dart';
import 'package:flutter/material.dart';
import '../../../customs/text-type.dart';

class PathRow extends StatelessWidget {
  PathCategory pathCategory;
  List<Path> paths;

  PathRow({this.paths, this.pathCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTextHeader(pathCategory==null?'Paths':pathCategory.title),
              TextButton(
                  onPressed: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  pathCategory==null ? AllPath():ListPath(pathCategory: pathCategory,)));
                  },
                  child: Text(
                    'See all >',
                    style: TextStyle(color: Colors.white38),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: pathRowHeight,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: paths
                .map((path) => Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: PathItem(
                        path: path,
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    ));
  }

}

class ListPath extends StatelessWidget {
  final PathCategory pathCategory;

  ListPath({this.pathCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.pathCategory.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
            itemCount: Paths.length,
            itemBuilder: (context,index){
              return  Column(
                children: [
                  PathItemB(path: Paths[index],),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              );
            }),
      ),
    );
  }
}

class PathItemB extends StatelessWidget{
  final Path path;

  const PathItemB({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightItem,
      child: Row(
        children: [
          Container(
            height: heightItem * 2 / 3,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(this.path.imgPlaceholder),
                  fit: BoxFit.fitWidth),
            ),
          ),
          SizedBox(width: 8,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextTitle(this.path.title),
              SizedBox(height: 8,),
              buildSubTextTitle('${this.path.numberCourses} courses')
            ],
          )
        ],
      ),
    );
  }
}


Widget buildRowPaths(List<Path> paths){
  return Container(
    height: pathRowHeight,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: paths
          .map((path) => Padding(
        padding: EdgeInsets.only(left: 16),
        child: PathItem(
          path: path,
        ),
      ))
          .toList(),
    ),
  );
}
