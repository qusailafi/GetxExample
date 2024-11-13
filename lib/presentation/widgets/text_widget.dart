
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 Widget textWidget(String txt,TextStyle? txtStyle){
   if(txtStyle==null){
     txtStyle=TextStyle(fontSize: 10,color:
     Colors.black);
   }
  return Container(child: Text(txt,style: txtStyle,),padding: EdgeInsets.all(10),);
}