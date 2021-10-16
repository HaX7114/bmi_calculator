import 'dart:developer';
import 'dart:math';

import 'package:bmi_calculator/Consts.dart';
import 'package:bmi_calculator/CubitsStates/CounterCubit.dart';
import 'package:bmi_calculator/CubitsStates/States.dart';
import 'package:bmi_calculator/Models/person.dart';
import 'package:bmi_calculator/MyWidgets/MyText.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatelessWidget {

  double max = 200.0;
  double min = 90.0;
  double last = 149;
  double next = 151;

  Color maleColor = Colors.blue;
  Color femaleColor = Colors.black26;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context , state){

        },
        builder: (context, state){
          return Scaffold(
            backgroundColor: K_backgroundColor,
            appBar: AppBar(
              backgroundColor: K_whiteColor,
              elevation: 0.0,
              centerTitle: true,
              title: MyText(
                text: 'BMI CALCULATOR',
                size: 16.0,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //First row
                  Expanded(
                    child: Row(
                      children: [
                        //First container on the left side
                        Expanded(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: K_whiteColor,
                                borderRadius: BorderRadius.circular(K_radius),
                                boxShadow: shadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(text: 'Age', size: 15.0),
                                  MyText(text: '${CounterCubit.get(context).person.age}', size: 50.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 50,
                                          child: RawMaterialButton(
                                            child: MyText(text: '-', size: 25.0,color: Colors.blue,),
                                            onPressed: (){
                                              CounterCubit.get(context).ageDecrement();

                                            },
                                            shape: CircleBorder(),
                                            fillColor: K_backgroundColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 60,
                                          child: RawMaterialButton(
                                            child: MyText(text: '+', size: 25.0,color: Colors.blue,),
                                            onPressed: (){
                                              CounterCubit.get(context).ageIncrement();
                                            },
                                            shape: CircleBorder(),
                                            fillColor: K_backgroundColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //Space
                        K_hSpace,
                        //Second container on the right side
                        Expanded(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: K_whiteColor,
                                borderRadius: BorderRadius.circular(K_radius),
                                boxShadow: shadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(text: 'Weight', size: 15.0),
                                  MyText(text: '${CounterCubit.get(context).person.weight}', size: 50.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 60,
                                          child: RawMaterialButton(
                                            child: MyText(text: '-', size: 25.0,color: Colors.blue,),
                                            onPressed: (){
                                              CounterCubit.get(context).weightDecrement();

                                            },
                                            shape: CircleBorder(),
                                            fillColor: K_backgroundColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 60,
                                          child: RawMaterialButton(
                                            child: MyText(text: '+', size: 25.0,color: Colors.blue,),
                                            onPressed: (){
                                              CounterCubit.get(context).weightIncrement();

                                            },
                                            shape: CircleBorder(),
                                            fillColor: K_backgroundColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  K_vSpace,
                  //Container of the height
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: K_whiteColor,
                          borderRadius: BorderRadius.circular(K_radius),
                          boxShadow: shadow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(text: 'Height', size: 15.0),
                            MyText(text: 'cm', size: 10.0,color: Colors.black26,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //Last number
                                TextButton(
                                  onPressed: (){
                                    CounterCubit.get(context).handleLast();
                                  },
                                  child: Column(
                                    children: [
                                      MyText(text: 'Last', size: 10.0),
                                      MyText(text: '${CounterCubit.get(context).last}', size: 15.0,color: Colors.black26,),
                                    ],
                                  ),
                                ),
                                //Your height
                                MyText(text: '${CounterCubit.get(context).person.height}', size: 50.0),
                                //Next number
                                TextButton(
                                  onPressed: (){
                                    CounterCubit.get(context).handleNext();
                                  },
                                  child: Column(
                                    children: [
                                      MyText(text: 'Next', size: 10.0),
                                      MyText(text: '${CounterCubit.get(context).next}', size: 15.0,color: Colors.black26,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                                max: max,
                                min: min,
                                value: CounterCubit.get(context).person.height,
                                onChanged: (value){
                                  CounterCubit.get(context).onChangeSlider(value);
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  K_vSpace,
                  //Container of the gender
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                        color: K_whiteColor,
                        borderRadius: BorderRadius.circular(K_radius),
                        boxShadow: shadow
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(text: 'Gender', size: 15.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(text: 'i\'m', size: 50.0),
                              MyText(text: 'Female', size: 15.0),
                              //Gender icon container
                              Container(
                                height: 40.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        onPressed: (){
                                          CounterCubit.get(context).person.gender = false;
                                          CounterCubit.get(context).chooseGenderColor();
                                        },
                                        icon: Icon(
                                          Icons.female,
                                          color: CounterCubit.get(context).femaleColor,
                                          size: 25.0,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: (){
                                          CounterCubit.get(context).person.gender = true;
                                          CounterCubit.get(context).chooseGenderColor();
                                        },
                                        icon: Icon(
                                          Icons.male,
                                          color: CounterCubit.get(context).maleColor,
                                          size: 25.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(color: Colors.black26),
                                ),
                              ),
                              MyText(text: 'Male', size: 15.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  K_vSpace,
                  //Button of calculating
                  Container(
                    height: 60.0,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(K_radius)),
                      fillColor: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: K_whiteColor,
                          ),
                          MyText(text: '  Calculate your mass index', size: 15.0,color: K_whiteColor,)
                        ],
                      ),
                      onPressed: (){
                        CounterCubit.get(context).person.result = bmiResult(CounterCubit.get(context).person.weight, CounterCubit.get(context).person.height);
                        Person person = CounterCubit.get(context).person;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BmiResult(person: person,),
                            )
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }



  bmiResult(weight,height)
  {
    return weight / pow(height / 100, 2);
  }

}
