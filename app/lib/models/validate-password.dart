class StringValidate{

  String content;
  bool checkLength({int minLength}){}
}

class ValidatePassword implements StringValidate{
  final int  defaultLength=8;
  @override
  String content;

  ValidatePassword({this.content});

  @override
  bool checkLength({int minLength}) {
    if(minLength==null){
      minLength=defaultLength;
    }

    return this.content.length>=minLength;
  }


}