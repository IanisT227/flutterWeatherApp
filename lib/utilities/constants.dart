import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 120.0,
);

const kMainPageTextStyle =
    TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w200, fontSize: 75.0);

const kInputDecoration = InputDecoration(
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 35.0,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
  border: OutlineInputBorder(borderSide: BorderSide.none),
);
