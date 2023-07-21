import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_the_design_alive_task/screens/PetListScreen/pet_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //initialRoute: LogInOrSignup.routeName,
          //routes: routes,
          theme: ThemeData(fontFamily: 'Changa'),
          home: const PetListScreen(),
        );
      },
    );
  }
}
