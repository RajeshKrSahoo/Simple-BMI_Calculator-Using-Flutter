import 'package:flutter_web/material.dart';

class myBMI extends StatefulWidget{

@override
bmiCalc createState()=> new bmiCalc();

}

class bmiCalc extends State<myBMI>{

  final TextEditingController _ageController= new TextEditingController();
  final TextEditingController _heightController= new TextEditingController();
  final TextEditingController _weightController= new TextEditingController();
  
  String rslt="";
  // var inches=0.0;
  double inMeter=0.0;
  double result=0.0;
  String finalRslt="";
  String reason="";

  void _calculator(){
    setState(() {
      int age=int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      // inches=height*12;
      inMeter= (height / 3.281);

      double weight=double.parse(_weightController.text);
      if((_ageController.text.isNotEmpty|| age>0)&& (_heightController.text.isNotEmpty || height>0)&&(_weightController.text.isNotEmpty || weight>0)){
         result= weight/(inMeter * inMeter); //BMI result
         print(result);

         if (double.parse(result.toStringAsFixed(1))<18.5){
           rslt="Underweight :( Please eat more and consult doctor for the best practice";
         }
         else if(double.parse(result.toStringAsFixed(1))>=18.5 && result<25.0){
            rslt="Having a Great Sexy Shape";
         }
         else if(double.parse(result.toStringAsFixed(1))>=25.07 && result<30){
           rslt="Overweight, Jyada mat khao :P thora sareer pe dhyan do";
         }
         else if(double.parse(result.toStringAsFixed(1))>=30.0){
           rslt="Obese";
         }
      }
      else{
        result=0;
      }
    });
     finalRslt= "Your BMI is: ${result.toStringAsFixed(1)}";
     reason="You are $rslt";
     
  }


void alertDialogue(){
     _calculator();
     showDialog(
            context: context,
                    
                    builder: (_) => new AlertDialog(
                      
                        title: new Text("BMI Report"),
                        content: new Text("$finalRslt \n\n$reason",
                        style: TextStyle(color:Colors.black,fontStyle: FontStyle.normal,fontSize: 19.9),),
                        
                        actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                        )
                );
      }
      

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      
        appBar: AppBar(
          
          title: Text("BMI Calculator"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
            new FlatButton(
                  onPressed: () {
                    debugPrint("Author @Rajesh Kumar Sahoo");
                    /*...*/
                  },
                  child: new Text('2019 \u00a9 by Rajesh'),
                )
          ],
        ),
        backgroundColor: Colors.blueGrey,
        body: new Container(
          alignment:Alignment.topCenter ,
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              new Image.network(
                'https://cdn2.iconfinder.com/data/icons/fitness-8/512/fitness-color-16-512.png',
                //'https://previews.123rf.com/images/kchung/kchung1403/kchung140300506/26788375-3d-illustration-of-bmi-body-mass-index-button-isolated-white-background.jpg',
                // 'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
                width: 90.0,
                height: 90.0,
                // color: Colors.blueAccent,
              ),
              Container(
                // alignment:Alignment.topCenter ,
                height: 245,
                width: 345,
                color: Colors.grey.shade100,
                child: Column(
                  children: <Widget>[

                     TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText:"e.g 34" ,
                        labelText: "Age",
                        icon: Icon(Icons.person),
                        ),


                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText:"e.g 6.5" ,
                        labelText: "Height",
                        icon: Icon(Icons.insert_chart),
                        ),
                        // obscureText: true,
 
                    ),

                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                       hintText:"e.g 104 KG" ,
                        labelText: "Weight",
                        icon: Icon(Icons.insert_chart),
                        ),
                        // obscureText: true,

                    ),

                    new Padding(padding:EdgeInsets.all(8.0) ),

                     new Container(
                          margin:EdgeInsets.only(left:15),
                          child: RaisedButton(color: Colors.pinkAccent,
                                child: Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 20.0),
                                ),
                          onPressed:alertDialogue,
                        //  onPressed: () {
                           
                              

                      ),
                     )
                  ],
                  ),
                ),
                // new Padding(padding: EdgeInsets.all(4.0),),
                // new Container(
                //   alignment:Alignment.bottomRight ,
                //   // height: 100,
                //   // width: 200,
                //   child: Column( 
                //     children: <Widget>[
                //       Text(" by",
                //      style: TextStyle(color:Colors.yellowAccent[200],fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,fontSize: 19.9),
                      
                //       ),
                //     // Padding(padding: const EdgeInsets.all(5.0),),
                //     //   Text("$reason",
                    
                //     //  style: TextStyle(color:Colors.yellowAccent,fontStyle: FontStyle.italic,fontSize: 15.9),
                      
                //     //   )
                      

                //     ],
                  
                // )
                // ),
          
            ]
            
          )
          
        )

    );
  }
  

}