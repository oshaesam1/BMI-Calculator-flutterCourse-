import 'dart:math';

import 'package:bmi_calculator/Result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiMain extends StatefulWidget {
  const BmiMain({Key? key}) : super(key: key);

  @override
  State<BmiMain> createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  bool isMale =true;
  double height =120.0;
  int weight =40;
  int age =20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:Text("BMI calculator") ,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                 children: [
                   Expanded(
                     child: GestureDetector(
                       onTap:()
                       {
                         setState(() {
                          isMale=true;
                         });
                       },
                       child: Container(
                       decoration: BoxDecoration(
                         color: isMale ? Colors.blue:Colors.indigo[400],
                         borderRadius:BorderRadius.circular(10.0),
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image(
                             image: AssetImage("images/male-gender.png"),height: 90,width: 90,
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           Text("Male",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight:FontWeight.bold),)
                         ],
                       ),
                 ),
                     ),
                   )
                   ,SizedBox(width: 20,)
                   , Expanded(
                     child: GestureDetector(
                       onTap:()
                       {
                         setState(() {
                           isMale=false;
                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           color:isMale? Colors.indigo[400]:Colors.blue,
                           borderRadius:BorderRadius.circular(10.0),
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(
                               image: AssetImage("images/femenine.png"),height: 90,width: 90,
                             ),
                             SizedBox(
                               height: 15,
                             ),
                             Text("Female",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight:FontWeight.bold),)
                           ],
                         ),
                       ),
                     ),
                   )
                 ],
              ),
            ),),
          )
          ,Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo[400],
                  borderRadius: BorderRadius.circular(10.0)
                ),
                width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight:FontWeight.bold),),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("${height.round()}",style: TextStyle(color:Colors.white,fontSize: 35,fontWeight:FontWeight.w600),)
                      , Text(
                        "CM",style: TextStyle(color:Colors.white,fontSize: 10,fontWeight:FontWeight.bold),)
                   ,
                    ],),
                  Slider(activeColor: Colors.white,
                      value: height,max: 300,min: 70, onChanged: (value){

                    setState(() {
                      height=value;
                    });
                      })

                ],

              ),),
            ),
          )
          ,Expanded(
            child: Container(color: Colors.white,
              width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[400],
                          borderRadius:BorderRadius.circular(10.0),
                        ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight:FontWeight.bold),),
                          Text("${age}",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight:FontWeight.bold),),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(backgroundColor: Colors.indigo,
                               onPressed: (){
                             setState(() {
                               age--;
                             });
                               },heroTag: 'age--',mini:true,child:Icon(Icons.remove))
,
                           FloatingActionButton(backgroundColor: Colors.indigo,
                               onPressed: (){
                             setState(() {
                               age++;

                             });
                               },heroTag: 'age++',mini:true,child:Icon(Icons.add))],
                       )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo[400],
                        borderRadius:BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight:FontWeight.bold),),
                          Text("${weight}",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight:FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(backgroundColor: Colors.indigo,
                                  onPressed: (){
                                    setState(() {
                                          weight--;
                                                       });
                                  },heroTag: 'weight--',mini:true,child:Icon(Icons.remove),)
                              ,
                              FloatingActionButton(backgroundColor: Colors.indigo,
                                  onPressed: (){
                                setState(() {
                                  weight++;
                                });
                                  },heroTag: 'weigh++',mini:true,child:Icon(Icons.add))],
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),),

          ),
          Container(
            width: double.infinity,
            color: Colors.indigo,
            child: MaterialButton(
              height: 30.0,
                onPressed: (){
                double result =weight/ pow(height/100,2);
                print(result);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>Result_Screen(
                    result:result,isMale:isMale,age: age)));
                    },
                child:Text("Calculate",style:TextStyle(
              color: Colors.white,
              fontSize:20,
            )),
          )
          )],
      ),
    );
  }
}
