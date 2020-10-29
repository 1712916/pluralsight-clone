import 'dart:core';

class Course{
  String title;
  String categoryId;
  String description;
  String imgPlaceholder;
  String video;
  List<String> authors;
  String level;
  String dateRelease;
  String hourLearning;
  double rating;
  int numsVote;
  double progressing;
  bool isBookmarked;

  Course(
      this.title,
      this.categoryId,
      this.description,
      this.imgPlaceholder,
      this.video,
      this.authors,
      this.level,
      this.dateRelease,
      this.hourLearning,
      this.rating,
      this.numsVote,
      this.progressing,
      this.isBookmarked);

//content in details

}

List<Course> getCourses(){
  return <Course>[
    Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, true),
    Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false),
    Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false),
    Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false), Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false), Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false), Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false),
    Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false),
    Course('Angular', '01', 'Đây là angular mô tả', "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac", 'video', ['Vinhnek','Kieu Phong'], 'Beginner', 'thg 2 2019', '9h 30', 4.5, 899, 10, false),

  ];
}



