import 'package:bmi_calculator/Consts.dart';
import 'package:bmi_calculator/Models/person.dart';
import 'package:bmi_calculator/MyWidgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_slide_animation/number_slide_animation.dart';
import 'package:animate_do/animate_do.dart';

class BmiResult extends StatelessWidget {
  final Person person;
  const BmiResult({Key? key,required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: K_backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: K_whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: MyText(
          text: 'BMI CALCULATOR',
          size: 16.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: K_whiteColor,
              borderRadius: BorderRadius.circular(K_radius),
              boxShadow: shadow
          ),
          child: Column(
            children: [
              K_vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  NumberSlideAnimation(
                    number: splitResult(1),
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 130.0,
                      fontWeight: FontWeight.w200,
                      color: K_blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: MyText(text: '. ', size: 40.0),
                  ),//D
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: NumberSlideAnimation(
                      number: splitResult(2),
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w200,
                        color: K_blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              K_vSpace,
              FadeInUp(
                duration: Duration(milliseconds: 1500),
                child: MyText(
                  text: determineBMIIndex(person.result),
                  size: 20.0,
                  color: determineBMIIndexColor(person.result),
                ),
              ),
              K_vSpace,
              K_vSpace,
              FadeInUp(
                duration: Duration(milliseconds: 1500),
                child: MyText(
                    text: 'BMI range is :',
                    size: 18.0,
                    color: K_blackColor.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                ),
              ),
              K_vSpace,
              //Range
              FadeInUp(
                duration: Duration(milliseconds: 1500),
                child: MyText(
                  text: determineBMIIndexRange(person.result),
                  size: 22.0,
                  color: K_blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              K_vSpace,
              K_vSpace,
              K_vSpace,
              K_vSpace,
              SlideInUp(
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    height: 57.0,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                      fillColor: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.replay,
                            color: K_whiteColor,
                          ),
                          MyText(text: '  Calculate new BMI', size: 15.0,color: K_whiteColor,)
                        ],
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  splitResult(int splitter)
  {
    String res;//What will  be shown in the text widget
    String result = person.result.toStringAsFixed(2);//Actual calculated result

    if(result.length == 5)//if the string is only 5 chars
      {
        splitter == 1?
        res = person.result.toStringAsFixed(2).substring(0,2)
            :
        res = person.result.toStringAsFixed(2).substring(3);
      }
    else //if the string is 6 chars
      {
        splitter == 1?
        res = person.result.toStringAsFixed(2).substring(0,3)
            :
        res = person.result.toStringAsFixed(2).substring(4);
      }


    return(res);
  }

  determineBMIIndex(bmiIndex)
  {
    String result;
    if(bmiIndex < 18.5)
      result = 'U n d e r   w e i g h t';
    else if(bmiIndex >= 18.5 && bmiIndex <= 25)
      result = 'H e a l t h y   w e i g h t';
    else if(bmiIndex >= 25 && bmiIndex <= 30)
      result = 'O v e r   w e i g h t';
    else
      result = 'O b e s i t y';

    return result.toUpperCase();
  }

  determineBMIIndexRange(bmiIndex)
  {
    String result;
    if(bmiIndex < 18.5)
      result = 'Less than 18.5 Kg/m\u00B2';
    else if(bmiIndex >= 18.5 && bmiIndex <= 25)
      result = '18.5 Kg/m\u00B2 - 24.9 Kg/m\u00B2';
    else if(bmiIndex >= 25 && bmiIndex <= 30)
      result = '25 Kg/m\u00B2 - 29.9 Kg/m\u00B2';
    else
      result = 'More than 30 Kg/m\u00B2';

    return result;
  }

  determineBMIIndexColor(bmiIndex)
  {
    Color result;
    if(bmiIndex < 18.5)
      result = Colors.blueAccent;
    else if(bmiIndex >= 18.5 && bmiIndex <= 25)
      result = Colors.greenAccent;
    else if(bmiIndex >= 25 && bmiIndex <= 30)
      result = Colors.orangeAccent;
    else
      result = Colors.redAccent;

    return result;
  }
}