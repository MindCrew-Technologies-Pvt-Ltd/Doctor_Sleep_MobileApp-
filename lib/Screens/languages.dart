import 'package:flutter/material.dart';


abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appbar;

  String get buttonmessage;

  String get title;

  String get docdev;

  String get cal;

  String get language;

  String get Homepage;

  String get mastersleep;

  String get sleepdiary;

  String get sleepappbar;

  String get sleepdiarytime;

  String get register;

  String get savedata;

  String get Modernize;

  String get tap1;

  String get tap2;

  String get tap3;

  String get button2;

  String get button3;

  String get button4;

  String get appbarA;

  String get citation;

  String get textcitation;

  String get appbarSS;

  String get textss;

  String get appbargraph;

  String get aveargevalue;

  String get graph1title;

  String get graph2title;

  String get graph3title;

  String get bedtimeweek;

  String get SleepLatencyweek;

  String get noofawakeningsweek;

  String get averagelengthofawakeningsweek;

  String get waketimeweek;

  String get scoopsofzenbevweek;

  String get selecteddate;

  String get bedtime;

  String get waketime;

  String get timetofallasleep;

  String get numberofawakenings;

  String get averagelengthofawakenings;

  String get scoopsofzenbev;

  String get BT;

  String get SL;

  String get AN;

  String get AL;

  String get WT;

  String get ZS;

  String get SaveData;

  String get ResetData;

  String get Error;

  String get CannotInsertSameDateDataAgain;

  String get DataSavedSuccessfully;

  String get Areyousureyouwanttodeleteallsaveddata;

  String get NoDataAvailable;

  String get PleaseEntertheData;

  String get Yes;

  String get No;

  String get Days;

  String get Ok;


}