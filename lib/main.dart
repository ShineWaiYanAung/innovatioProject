import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/Functions/Cubit/cubit_data_state_mangaement.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/OnBoardingPage/onBoardingScreen.dart';
import 'package:innovation_proeject/responsiveScreenControllerAbstract/parent_screen_controller.dart';
import 'configure/theme/AppTheme.dart';
import 'package:device_preview/device_preview.dart';
import 'features/appBusinessFeatures/pages/subpages/test.dart';
import 'features/authentication/pages/mainScreen/Bloc/cubit.dart';
import 'features/authentication/pages/mainScreen/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isBlack = true; // Switch between themes
  runApp(
    DevicePreview(
        enabled: true,
        builder: (context) =>
            MyApp(theme: AppThemeFactory.getAppThemeFactory(isBlack))),
  );
}

class MyApp extends StatelessWidget {
  final AppTheme theme;
  const MyApp({super.key, required this.theme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesCubit(),
        ),
        BlocProvider(create: (context)=>DataImportCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: theme.scaffoldBackGroundColor,
          buttonTheme: ButtonThemeData(buttonColor: theme.buttonColor),
          textTheme: TextTheme(
            titleLarge: TextStyle(
                color: theme.largeTextColor,
                fontFamily: "InriaSerif",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2), // Use theme instance
            titleMedium: TextStyle(color: theme.largeTextColor,fontFamily: "InriaSerif",),
            headlineLarge: TextStyle(color: theme.focusTextColor,fontFamily: "InriaSerif",),
            labelMedium: TextStyle(color: theme.focusTextColor,fontFamily: "InriaSerif",),
            titleSmall: TextStyle(color: theme.largeTextColor,fontFamily: "InriaSerif",),
            headlineSmall: TextStyle(color: theme.unSelectedTextColor),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnBoardingScreen(),)
    );
  }
}

