import 'package:flimsa01mvp/features/auth/presentations/screens/welcome.dart';
import 'package:flimsa01mvp/helpers/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await initDI();

  // if(!Get.find<AuthController>().isFirstTimeInstall()){
  //   print("object ---------------000000000000-----------------");
  //   Get.find<AuthController>().setFirstTimeInstall();
  // }else{
  //   print("object ---------------11111111111-----------------");
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //print("Main.dart build");
    return GetMaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomeScreen(),
    );
  }

}



// WelcomeScreen
// PlayVideosScreen 
// Search
// SubscriptionPage

