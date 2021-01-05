import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  int price;
  PriceLabel(this.price);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(

        height: 20,
        width: 50,

        decoration: BoxDecoration(
          color: Colors.amber,

        ),
        child: Center(
          child: Text(
              ((){
                if(this.price==0){
                  return "\$ FREE";
                }else{
                  return "\$ "+price.toString();

                }
              })()
          ),
        ),
      ),
    );
  }
}
