import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI()));
}
class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  String result ="";
  String status ="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('BMI calculater'),
      ),
      body: Container(
        color: Colors.grey,
        margin: EdgeInsets.all(20),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: CircleAvatar(radius: 100,backgroundImage: AssetImage('images/bmis.jpg'),),
                ),
                Text("Your BMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 50),
                  child: TextField(
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    controller: height,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        fillColor: Colors.pink,
                        filled: true,
                      labelText: 'Height',
                      hintText: 'Height in meter',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 5),
                  child: TextField(
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    controller: weight,
                        decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.pink,
                        filled: true,
                        labelText: 'Weight',
                        hintText: 'Weight in KG'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    child: Text('Calculate'),
                    onPressed: (){
                      setState(() {
                        double heightSqr =double.parse(height.text)*double.parse(height.text);
                        double bmi = int.parse(weight.text)/heightSqr;
                        if(bmi<18){
                          status="  under weight";
                        }
                        else if(bmi<24){
                          status ="  Normal weight";
                        }
                        else if(bmi>24){
                          status ="  obesity";
                        }
                        result =bmi.toString()+status;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                      color: Colors.black,
                      height: 50,
                      child: Center(child: Text("BMI : "+result,style: TextStyle(color: Colors.white),))),
                )

              ],
            ),
          ),
        ),
      ),
    );

  }
}
