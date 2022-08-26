import 'package:flutter/material.dart';

class Result_Screen extends StatelessWidget {
  final double ?result;
  final bool isMale;
  final int ?age;

  Result_Screen({
      required this.result,
      required this.isMale,
      required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        } ,
          icon: Icon(Icons.keyboard_arrow_left_outlined),
        ),
        title:Text("BMI calculator") ,
      ),
      body:Padding(
        padding: const EdgeInsets.only(left:40.0,top:150.0,right:40.0,bottom: 150.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.indigo[400],
            borderRadius:BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Gender:${isMale?'Male':'Female'}",style:TextStyle(
                   color: Colors.white,fontSize:25.0,fontWeight: FontWeight.bold
              ),)
              ,Text(
                "Age:${age}",style:TextStyle(
                  color: Colors.white,fontSize:25.0,fontWeight: FontWeight.bold
              ),)
             , Text(
                "Result:${result!.round()}",style:TextStyle(
                  color: Colors.white,fontSize:25.0,fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      )
    );
  }
}
