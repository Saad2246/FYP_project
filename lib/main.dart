// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pci/constants.dart';
import 'package:pci/onboarding_view_model.dart';
import 'package:pci/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pci/screens/splash/splash_screen01.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(Get.width, Get.height),
        builder: (context, widget) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => OnboardingViewModel(),
                ),
              ],
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  // ignore: prefer_const_constructors
                  textTheme: TextTheme(
                    bodyText1: TextStyle(color: kTextColor),
                    bodyText2: TextStyle(color: kTextColor),
                  ),
                  primarySwatch: Colors.blue,
                  appBarTheme: AppBarTheme(
                    color: Colors.white,
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.black),
                    toolbarTextStyle: TextTheme(
                      headline6: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ).bodyText2,
                    titleTextStyle: TextTheme(
                      headline6: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ).headline6,
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                  ),
                ),
                title: "PCI",
                home: SplashScreen01(),
                // initialRoute: SplashScreen01(),
                routes: routes,
              ),
            ));
  }
}
