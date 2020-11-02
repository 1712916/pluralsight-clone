import 'package:app/custom-appbar.dart';
import 'package:app/ulti/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Home'),
      body: RefreshIndicator(
        onRefresh: () async {
          print('Hello');
          return;
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 200,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    'Banner here',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: Categories.map((category) => Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(category.title),
                              TextButton(
                                  onPressed: () {}, child: Text('View All >')),
                            ],
                          ),
                        ),
                        Center(
                            child: Container(
                          height: 200,

                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: findCourseByCategoryId(category.id)
                                    .map((course) => Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: CourseItem(course),
                                    ))
                                    .toList(),
                              ),
                        )),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )).toList()
              + [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My paths"),
                            TextButton(
                                onPressed: () {}, child: Text('View All >')),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child:  Center(
                          child: Container(
                            height: 200,

                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: findCourseByCategoryId("01")
                                  .map((course) => Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: CourseItem(course),
                              ))
                                  .toList(),
                            ),
                          )),
                    ),
                    Container(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Bookmarks"),
                            TextButton(
                                onPressed: () {}, child: Text('View All >')),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child:  Center(
                          child: Container(
                            height: 200,

                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: findCourseByCategoryId("01")
                                  .map((course) => Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: CourseItem(course),
                              ))
                                  .toList(),
                            ),
                          )),
                    ),
                    Container(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),

                  ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseItem extends StatefulWidget {
  Course course;

  CourseItem(this.course);

  @override
  _CourseItemState createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          // margin: EdgeInsets.only(
          //     right: 16, left: widget.index == 0 ? 16 : 0, bottom: 16, top: 8),
          width: 210,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: widget.course.imgPlaceholder,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.course.imgPlaceholder),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                      ),
                    ),
                    Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            widget.course.isBookmarked
                                ? Container(
                                    padding: EdgeInsets.all(16),
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.bookmark_border),
                                  )
                                : Container(),
                            Container(
                                alignment: Alignment.bottomCenter,
                                child: LinearProgressIndicator(
                                  value: 0.1,
                                )),
                          ],
                        ))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.course.title),
                      widget.course.authors.length == 1
                          ? Text(widget.course.authors[0])
                          : Text(widget.course.authors[0] +
                              ', +' +
                              (widget.course.authors.length - 1).toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.course.level),
                          Text(widget.course.dateRelease),
                          Text(widget.course.hourLearning),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star_half_outlined,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow[500],
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
