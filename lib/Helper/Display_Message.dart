import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Display_Message{
 
  
  SnackBar errorMessage(String text){
    

    return  SnackBar(
              content: Column(
                 children: [
                    Text("Error", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                    SizedBox(
                    height: 5,
                    ),
                    Text(text, style: TextStyle(color: Colors.white),),
                  ],
              ),
             // backgroundColor: Colors.red,
              );
  }

  SnackBar succesMessage(String text){
    

    return  SnackBar(
              content: Column(
                 children: [
                    Text("Error", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                    SizedBox(
                    height: 5,
                    ),
                    Text(text, style: TextStyle(color: Colors.white),),
                  ],
              ),
              backgroundColor: Colors.green,
              );
  }
}