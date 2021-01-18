import 'package:app/models/categories-response-model.dart';
import 'package:app/models/data.dart';
import 'package:app/provider/login-provider.dart';
 import 'package:app/services/category-services.dart';
import 'package:app/services/user-services.dart';
import 'package:app/widgets/customs/text-type.dart';
import 'package:provider/provider.dart';

import 'about-skill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line


class PopularSkills extends StatefulWidget {
  @override
  _PopularSkillsState createState() => _PopularSkillsState();
}

class _PopularSkillsState extends State<PopularSkills> {
  List<Category> categories;
  List<bool> categoryLikes=[];

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (()async{
      var response=await  CategoryServices.getAllCategory();
      List<Category> categories=categoriesResponseModelFromJson(response.body).payload;
      List<String> favoriteCategories=Provider.of<LoginProvider>(context).userResponseModel.userInfo.favoriteCategories;
      setState(() {
        this.categories= categories;
        for(var i=0;i<categories.length;i++){
          if(favoriteCategories.contains(categories[i].id)){
            categoryLikes.add(true);
          }else{
            categoryLikes.add(false);
          }

        }

      });
    })();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
          child: TextTitle(  AppLocalizations.of(context).favoriteCategory.toUpperCase()),
          ),
        ),
        SizedBox(height: 8,),

        categories==null?SizedBox():Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: InputChip(
                  onPressed: () async {
                   var loginProvider=Provider.of<LoginProvider>(context,listen: false);
                   loginProvider.addNewFavoriteCategory(categories[index].id);
                    var response= await UserServices.updateFavoriteCategories(token: loginProvider.userResponseModel.token,categoryIds: loginProvider.userResponseModel.userInfo.favoriteCategories);
                    if(response.statusCode==200){
                      setState(() {
                        categoryLikes[index]=!categoryLikes[index];
                      });
                    }

                  },
                  label: Semantics(
                    button: true,
                    child: Row(
                      children: [
                        categoryLikes[index]?Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(Icons.check_circle,size: 16,),
                        ):SizedBox(),

                        Text(categories[index].name),
                      ],
                    ),
                  ),
                ),
              );
            }

          ),
        ),
        SizedBox(height: 16,)
      ],
    ));
  }
}
