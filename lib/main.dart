import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

void main()=> runApp(MaterialApp(
  theme: ThemeData(
    buttonTheme: ButtonThemeData(minWidth: double.infinity, height: 50.0),
    fontFamily:'Gilroy',
  primaryColor: HexColor('298f00'),),
  home: Homepage(),

  debugShowCheckedModeBanner: true,
),
);

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
final myController = TextEditingController();

void dispose(){
  myController.dispose();
  super.dispose();
}

final control = TextEditingController();

void disposed(){
  control.dispose();
  super.dispose();
}

int _value=1;
String password;
String name;

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body:

        SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(21,40, 16, 8),
                child: Text(('Organizational Information'),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.fromLTRB(21,0, 16, 0),
                child: Text('A little information about your company'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(21,16, 120, 0),
                child: StepProgressIndicator(totalSteps: 3,
                currentStep: 1,
                selectedColor: Colors.green, unselectedColor: Colors.grey,
                crossAxisAlignment: CrossAxisAlignment.start,
                roundedEdges: Radius.circular(24),
                  padding:4,
                ),
              ),

              SizedBox( height: 16,),

              Padding(

                padding: const EdgeInsets.fromLTRB(21,16, 21, 8),
                child: TextField(

                  controller: control,
                  decoration: InputDecoration(
                      labelText: 'ORGANIZATION NAME',hintText: 'insert your company name', errorText: 'This field must not be empty',
                      border: OutlineInputBorder()),

                  style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 18),
                  textInputAction: TextInputAction.done,
                  autocorrect: true,
                  autofocus: true,
                  onChanged: (texts) { name = texts; }, ),
                ),


              Padding(


                padding: const EdgeInsets.fromLTRB(21,16, 21, 32),
                child: TextField(


                  controller: myController ,
                  obscureText: true,
                  decoration: InputDecoration(
                        labelText: 'ORGANIZATION TYPE',
                      border: OutlineInputBorder()),

                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18),
                  textInputAction: TextInputAction.done,
                  autocorrect: true,
                  autofocus: true,
                  onChanged: (text) { password = text; }, ),
              ),


              Padding(

                padding: const EdgeInsets.fromLTRB(21,16, 21, 32),
                child: TextField(

                  controller: myController ,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'ADDRESS',
                      border: OutlineInputBorder()),

                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18),
                  textInputAction: TextInputAction.done,
                  autocorrect: true,
                  autofocus: true,
                  onChanged: (text) { String password = text; }, ),
              ),

              Padding(

                padding: const EdgeInsets.fromLTRB(21,16, 21, 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: DropdownButton(
                    

                    value: _value,
                    items: [
                      DropdownMenuItem(child: Text('1-50'),
                      value: 1,
                      ),

                      DropdownMenuItem(child: Text('50-100'),
                      value: 2,),

                      DropdownMenuItem(child: Text('100-150'),value: 3,),

                      DropdownMenuItem(child: Text('150-200'), value: 4,),
                    ],

                    onChanged: (value) {

                      setState(() {
                        _value=value;
                      });

                    },
                  ),
                ),
              ),

           Padding(
             padding: const EdgeInsets.fromLTRB(21,0, 21, 0),
             child: SizedBox(

               width: double.infinity,
               height: 50,
               child: TextButton(
                 child:

                 Text('PROCEED',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 1
                 ),),
    style:
    ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(HexColor("298f00"),),),
    onPressed: (
                   ){



    showDialog(
    context: context,
    builder: (context) {
    return
    AlertDialog(content: Text("welcome" + " " + control.text + " " +
    "Your Password is" + " " + myController.text),
    );
    },


    );
    },
    ),
             ),
           ),
              //),
            ],
          ),
        ),
    );
  }
}
