import 'dart:core';

class Skill{
  String id;
  String name;

  Skill({this.name});
}

class Author{
  String id;
  String name;
  String avt;

  String description;
  String website;

  Author({this.id, this.name, this.avt, this.description, this.website});
}

List<Author> Authors=[
  Author(id: '01',name: 'Hackkoc', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),
  Author(id: '02',name: 'Vinh nek', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),
  Author(id: '011',name: 'Kieu Phong', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),
  Author(id: '012',name: 'Vinh Ngo', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),
  Author(id: '013',name: 'Ha Ha', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),
  Author(id: '014',name: 'Hackkoc', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),
  Author(id: '015',name: 'Hackkoc', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),
  Author(id: '014',name: 'Hackkoc', avt:       "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",description: "HELooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",website: "https://www.facebook.com/bossxomlut/"),

];

Author findAuthorById(String id){
  for(int i=0;i<Authors.length;i++){
    if(Authors[i].id==id  ) return Authors[i];
  }
  return Authors[0];
}
class Path{
  String imgPlaceholder;
  String title;
  int numberCourses;
  double learningTime;
  String description;
  Path({this.imgPlaceholder, this.title, this.numberCourses, this.learningTime, this.description});
//
}
class PathCategory{
  String title;
  String id;

  PathCategory({this.title, this.id});
}
List<PathCategory> pathCategories=[
  PathCategory(title: 'Conferences',id: '01'),
  PathCategory(title: 'Certifications',id: '02'),
  PathCategory(title: 'Software Development',id: '03'),
  PathCategory(title: 'IT Ops',id: '04'),
  PathCategory(title: 'Information Security',id: '05'),
];


List<Path> Paths=[
  Path(title: 'Styling the Web with Boostrap',learningTime: 7,description: "MÁY ĐÀO HẦM CỦA TUYẾN ĐƯỜNG SẮT ĐÔ THỊ SỐ 3, ĐOẠN NHỔN - GA HÀ NỘI ĐÃ VỀ ĐẾN VIỆT NAM Các bộ phận của máy đào hầm đầu tiên (gọi tắt là TBM) cho tuyến đường sắt đô thị số 3, đoạn Nhổn – Ga Hà Nội đã cập cảng Hoàng Diệu, Hải Phòng vào ngày 27/10/2020 và bắt đầu vận chuyển về ga ngầm S9 từ đầu tháng 11/2020 và hoàn thành lắp đặt vào giữa tháng 01/2021." ,numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),
  Path(title: 'Styling the Web with Boostrap',numberCourses: 4,imgPlaceholder:  "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac" ),

];
class Course {
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

List<Course> Courses = [
  Course(
      'Angular',
      '02',
      "ĐỪNG GỌI TÔI KHI CHƯA ĐƯỢC PHÉP. Thanh tra Sở TT&TT Hà Nội vừa ra quyết định xử phạt vi phạm hành chính đối với công ty TNHH Trung tâm Anh ngữ VUS Miền Bắc. Doanh nghiệp này có địa chỉ đăng ký kinh doanh tại tầng 3, tòa nhà Golden Place, số 54 Lê Văn Lương, Thanh Xuân, Hà Nội. ĐỪNG GỌI TÔI KHI CHƯA ĐƯỢC PHÉP. Thanh tra Sở TT&TT Hà Nội vừa ra quyết định xử phạt vi phạm hành chính đối với công ty TNHH Trung tâm Anh ngữ VUS Miền Bắc. Doanh nghiệp này có địa chỉ đăng ký kinh doanh tại tầng 3, tòa nhà Golden Place, số 54 Lê Văn Lương, Thanh Xuân, Hà Nội. ĐỪNG GỌI TÔI KHI CHƯA ĐƯỢC PHÉP. Thanh tra Sở TT&TT Hà Nội vừa ra quyết định xử phạt vi phạm hành chính đối với công ty TNHH Trung tâm Anh ngữ VUS Miền Bắc. Doanh nghiệp này có địa chỉ đăng ký kinh doanh tại tầng 3, tòa nhà Golden Place, số 54 Lê Văn Lương, Thanh Xuân, Hà Nội. ",
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '01',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      false),
  Course(
      'Angular',
      '02',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '02',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '02',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '02',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '03',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
  Course(
      'Angular',
      '04',
      'Đây là angular mô tả',
      "https://firebasestorage.googleapis.com/v0/b/vcafe-5ad8e.appspot.com/o/images%2F01.png?alt=media&token=540ed0fd-7321-4e9e-acaf-ffdf5e7486ac",
      'video',
      ['01', '02'],
      'Beginner',
      'thg 2 2019',
      '9h 30',
      4.5,
      899,
      10,
      true),
];

class Category {
  String title;
  String id;
  Category({this.title, this.id});
}

List<Category> Categories = [
  Category(title: "Sofware Development", id: "01"),
  Category(title: "IT Operations", id: "02"),
  Category(title: "Data Professional", id: "03"),
  Category(title: "Security Professional", id: "04"),
];

List<Course> findCourseByCategoryId(String id,int size) {
  //thuat toan hoi cui
  var data=Courses.where((course) => course.categoryId == id).toList();
  if(size==-1 || data.length <size){
    return data;
  }
  return data.sublist(0,size);


}

List<Course> findCourseByBookmark(int size) {
  //thuat toan hoi cui
  var data=Courses.where((course) => course.isBookmarked).toList();
  if(size==-1 || data.length <size){
    return data;
  }
  return data.sublist(0,size);


}



