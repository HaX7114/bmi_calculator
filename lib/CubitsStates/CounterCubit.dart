import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/CubitsStates/States.dart';
import 'package:bmi_calculator/Models/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{

  CounterCubit() : super(InitialCounterState());//The Initial State of the counter

  static CounterCubit get(context) => BlocProvider.of(context);

  double max = 200.0;
  double min = 90.0;
  double last = 149;
  double next = 151;

  Color maleColor = Colors.blue;
  Color femaleColor = Colors.black26;
  Person person = Person();


  void weightIncrement()
  {
    //Weight range
    person.weight < 120 ? person.weight++ : person.weight = 120;
    emit(CounterPlusState());
  }

  void weightDecrement()
  {
    //Weight range
    person.weight > 40 ? person.weight-- : person.weight = 40;
    emit(CounterMinusState());
  }

  void ageIncrement()
  {
    //Age range
    person.age < 90 ? person.age++ : person.age = 90;
    emit(CounterPlusState());
  }

  void ageDecrement()
  {
    //Age range
    person.age > 5 ? person.age-- : person.age = 5;//Age range
    emit(CounterMinusState());
  }

  void heightIncrement()
  {
    //Age range
    person.age < 90 ? person.age++ : person.age = 90;
    emit(CounterPlusState());
  }

  void heightDecrement()
  {
    //Age range
    person.age > 5 ? person.age-- : person.age = 5;//Age range
    emit(CounterMinusState());
  }

  void onChangeSlider(value)
  {
    person.height = value.floorToDouble();
    next = next >= max? person.height : person.height + 1;
    last = last <= min? person.height : person.height -1;

    emit(CounterSliderState());
  }



  handleNext()
  {
    person.height = next;
    if(next < max)
    {
      next = person.height + 1;
      last = person.height - 1;
    }
    emit(CounterPlusState());
  }

  handleLast()
  {
    person.height = last;
    if(last > min)
    {
      next = person.height + 1;
      last = person.height - 1;
    }
    emit(CounterMinusState());
  }

  //Function used when user choose his / her gender to control the color
  chooseGenderColor(){
    if(person.gender)
    {
      maleColor = Colors.blue;
      femaleColor = Colors.black26;
    }
    else
    {
      maleColor = Colors.black26;
      femaleColor = Colors.blue;
    }
    emit(GenderChangedState());
  }

}