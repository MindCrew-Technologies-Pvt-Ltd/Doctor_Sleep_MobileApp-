import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Screens/localization_helper.dart';

class Strings {
  static String appbar(BuildContext context) {
    return Intl.message('CHOOSE LANGUAGE', name: 'appbar', locale: Localizations.localeOf(context).toString());
  }

  static String buttonmessage(BuildContext context) {
    return Intl.message('Choose Your Language', name: 'buttonmessage', locale: Localizations.localeOf(context).toString());
  }

  static String title(BuildContext context) {
    return Intl.message('Sleep Calculator', name: 'title', locale: Localizations.localeOf(context).toString());
  }

  static String docdev(BuildContext context) {
    return Intl.message('Doctor-Developed', name: 'docdev', locale: Localizations.localeOf(context).toString());
  }

  static String cal(BuildContext context) {
    return Intl.message('ZENBEV SLEEP CALCULATOR', name: 'cal', locale: Localizations.localeOf(context).toString());
  }

  static String language(BuildContext context) {
    return Intl.message('Language', name: 'language', locale: Localizations.localeOf(context).toString());
  }

  static String Homepage(BuildContext context) {
    return Intl.message('Home', name: 'Homepage', locale: Localizations.localeOf(context).toString());
  }

  static String mastersleep(BuildContext context) {
    return Intl.message('MASTER SLEEP DIARY', name: 'mastersleep', locale: Localizations.localeOf(context).toString());
  }

  static String sleepdiary(BuildContext context) {
    return Intl.message('Enter Sleep Diary\n           Here', name: 'sleepdiary', locale: Localizations.localeOf(context).toString());
  }

  static String sleepappbar(BuildContext context) {
    return Intl.message('ENTER SLEEP DIARY HERE', name: 'sleepappbar', locale: Localizations.localeOf(context).toString());
  }

  static String sleepdiarytime(BuildContext context) {
    return Intl.message('Enter military time (e.g., 11:30PM as 23:30)', name: 'sleepdiarytime', locale: Localizations.localeOf(context).toString());
  }

  static String register(BuildContext context) {
    return Intl.message('Register a new week.', name: 'register', locale: Localizations.localeOf(context).toString());
  }

  static String savedata(BuildContext context) {
    return Intl.message('SAVE DATA', name: 'savedata', locale: Localizations.localeOf(context).toString());
  }

  static String Modernize(BuildContext context) {
    return Intl.message('Modernize your sleep tracking habits by using the\nDoctor-Developed Zenbev Sleep Calculator', name: 'Modernize', locale: Localizations.localeOf(context).toString());
  }

  static String tap1(BuildContext context) {
    return Intl.message('Tap the button to register a\n new week.', name: 'tap1', locale: Localizations.localeOf(context).toString());
  }

  static String tap2(BuildContext context) {
    return Intl.message('Enter sleep data as you\nprogess.', name: 'tap2', locale: Localizations.localeOf(context).toString());
  }

  static String tap3(BuildContext context) {
    return Intl.message('Keep track of your sleep habits\nthrough informative graphs.', name: 'tap3', locale: Localizations.localeOf(context).toString());
  }

  static String button2(BuildContext context) {
    return Intl.message('Weekly Summary\n            Sheet', name: 'button2', locale: Localizations.localeOf(context).toString());
  }

  static String button3(BuildContext context) {
    return Intl.message('Summary Graphs', name: 'button3', locale: Localizations.localeOf(context).toString());
  }

  static String button4(BuildContext context) {
    return Intl.message('Acknowledgement', name: 'button4', locale: Localizations.localeOf(context).toString());
  }

  static String appbarA(BuildContext context) {
    return Intl.message('ACKNOWLEDGEMENTS', name: 'appbarA', locale: Localizations.localeOf(context).toString());
  }

  static String citation(BuildContext context) {
    return Intl.message('CITATION', name: 'citation', locale: Localizations.localeOf(context).toString());
  }

  static String textcitation(BuildContext context) {
    return Intl.message('Protein source tryptophan versus pharmaceutical\ngrade tryptophan as an efficacious treatment for\nchronic insomnia, Nutritional Neuroscience, 8:2,\n121-127, DOI: 10.1080/10284150500069561\n                                                                                                             Craig Hudson, Susan Patricia Hudson,Tracy Hecht,\nJoan MacKenzie', name: 'textcitation', locale: Localizations.localeOf(context).toString());
  }

  static String appbarSS(BuildContext context) {
    return Intl.message('Summary Sheet', name: 'appbarSS', locale: Localizations.localeOf(context).toString());
  }

  static String textss(BuildContext context) {
    return Intl.message('BT  =  Bed Time (Time Entering Bed)\n\nSL  =  Sleep Latency (Time Taken To Fall Asleep)\n\nAN =  Number of Awakenings\n\nAL  =  Average Length of Awakenings (Minutes)\n\nWT =  Wake Time (Time of Awakening)\n\nZS  =  Scoops of Zenbev', name: 'textss', locale: Localizations.localeOf(context).toString());
  }

  static String appbargraph(BuildContext context) {
    return Intl.message('Summary Graph', name: 'appbargraph', locale: Localizations.localeOf(context).toString());
  }

  static String aveargevalue(BuildContext context) {
    return Intl.message('AVERAGE VALUES', name: 'aveargevalue', locale: Localizations.localeOf(context).toString());
  }

  static String graph1title(BuildContext context) {
    return Intl.message('Sleep Latency', name: 'graph1title', locale: Localizations.localeOf(context).toString());
  }

  static String graph2title(BuildContext context) {
    return Intl.message('Sleep Efficiency', name: 'graph2title', locale: Localizations.localeOf(context).toString());
  }

  static String graph3title(BuildContext context) {
    return Intl.message('TST and TIB', name: 'graph3title', locale: Localizations.localeOf(context).toString());
  }

  static String bedtimeweek(BuildContext context) {
    return Intl.message('Bed Time', name: 'bedtimeweek', locale: Localizations.localeOf(context).toString());
  }

  static String SleepLatencyweek(BuildContext context) {
    return Intl.message('Sleep Latency', name: 'SleepLatencyweek', locale: Localizations.localeOf(context).toString());
  }

  static String noofawakeningsweek(BuildContext context) {
    return Intl.message('Number of\nAwakenings', name: 'noofawakeningsweek', locale: Localizations.localeOf(context).toString());
  }

  static String averagelengthofawakeningsweek(BuildContext context) {
    return Intl.message('  Average Length of\n        Awakening', name: 'averagelengthofawakeningsweek', locale: Localizations.localeOf(context).toString());
  }

  static String waketimeweek(BuildContext context) {
    return Intl.message('Wake Time', name: 'waketimeweek', locale: Localizations.localeOf(context).toString());
  }

  static String scoopsofzenbevweek(BuildContext context) {
    return Intl.message('Scoops of Zenbev', name: 'scoopsofzenbevweek', locale: Localizations.localeOf(context).toString());
  }

  static String getLocalized(BuildContext context, String key) {
    print("key => $key");
    print("key => ${Intl.message(key, locale: "fr")}");
    print("key => ${Localizations.localeOf(context).toString()}");
    return Intl.message(key, locale: Localizations.localeOf(context).toString());
  }
}

