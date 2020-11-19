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