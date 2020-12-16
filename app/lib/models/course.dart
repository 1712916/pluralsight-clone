// class Course {
//   String id;
//   String title;
//   String categoryId;
//   String description;
//   String imgPlaceholder;
//   String video;
//   List<String> authors;
//   String level;
//   String dateRelease;
//   String hourLearning;
//   double rating;
//   int numsVote;
//   double progressing;
//
//   Course(
//       {this.id,
//       this.title,
//       this.categoryId,
//       this.description,
//       this.imgPlaceholder,
//       this.video,
//       this.authors,
//       this.level,
//       this.dateRelease,
//       this.hourLearning,
//       this.rating,
//       this.numsVote,
//       this.progressing});
//
// //content in details
//
// }
//
// class CourseCategory {
//   String title;
//   String id;
//   CourseCategory({this.title, this.id});
// }
//
// List<CourseCategory> Categories = [
//   CourseCategory(title: "Sofware Development", id: "01"),
//   CourseCategory(title: "IT Operations", id: "02"),
//   CourseCategory(title: "Data Professional", id: "03"),
//   CourseCategory(title: "Security Professional", id: "04"),
// ];
//
// // List<Course> findCourseByBookmark(int size) {
// //   //thuat toan hoi cui
// //   var data = Courses.where((course) => course.isBookmarked).toList();
// //   if (size == -1 || data.length < size) {
// //     return data;
// //   }
// //   return data.sublist(0, size);
// // }
//
// List<Course> Courses = [
//   Course(
//     id: "01",
//     title: 'Angular',
//     categoryId: '02',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5fo.jpg",
//     video: 'video',
//     authors: ['05'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "02",
//     title: 'C++',
//     categoryId: '02',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5fl.jpg",
//     video: 'video',
//     authors: ['01', '02', '03', '04', '05'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "03",
//     title: 'Python',
//     categoryId: '02',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5e8.jpg",
//     video: 'video',
//     authors: ['03', '02', '06'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "04",
//     title: 'React Native',
//     categoryId: '02',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5ge.jpg",
//     video: 'video',
//     authors: ['05', '04'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "05",
//     title: 'Java core',
//     categoryId: '02',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5dc.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "06",
//     title: 'Flutter',
//     categoryId: '01',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5ht.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "07",
//     title: 'Android',
//     categoryId: '01',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5g4.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "08",
//     title: 'C#',
//     categoryId: '01',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5fo.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "09",
//     title: 'Docker',
//     categoryId: '01',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/78.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "10",
//     title: 'Node red',
//     categoryId: '01',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5j1.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "11",
//     title: 'Vuejs',
//     categoryId: '03',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5gj.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "12",
//     title: 'Water Fall',
//     categoryId: '03',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5ia.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "13",
//     title: 'Scrum',
//     categoryId: '03',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5hq.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "14",
//     title: 'Computer science',
//     categoryId: '04',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/4d.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "16",
//     title: 'Angular',
//     categoryId: '04',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5e8.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "17",
//     title: 'Deep learning',
//     categoryId: '04',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5gu.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "18",
//     title: 'Javascript',
//     categoryId: '04',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/4d.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "19",
//     title: 'Html',
//     categoryId: '04',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/62.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
//   Course(
//     id: "20",
//     title: 'Meow meow',
//     categoryId: '04',
//     description:
//         "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
//     imgPlaceholder: "https://cdn2.thecatapi.com/images/5i4.jpg",
//     video: 'video',
//     authors: ['01', '02'],
//     level: 'Beginner',
//     dateRelease: 'thg 2 2019',
//     hourLearning: '9h 30',
//     rating: 4.5,
//     numsVote: 899,
//     progressing: 10,
//   ),
// ];
