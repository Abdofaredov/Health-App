import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/bloc_observer.dart';
import 'package:healthapp/cubits/ShopView/shop_view_cubit.dart';
import 'package:healthapp/cubits/UserRecord_Cubit/user_record_cubit.dart';
import 'package:healthapp/cubits/auth_cupit/authcupit_cubit.dart';
import 'package:healthapp/cubits/navBarCubit/cubit/nav_bar_cubit_cubit.dart';
import 'package:healthapp/data/services/web_services/dish_cupit/get_dishes_cubit.dart';
import 'package:healthapp/firebase_options.dart';
import 'package:healthapp/shared/networks/local/cach_helper.dart';
import 'package:healthapp/views/auth/logIn_view/logIn_view.dart';
import 'package:healthapp/views/auth/onpoarding_view.dart/onboarding.dart';
import 'package:healthapp/views/auth/signUp_view/sign_Up_view.dart';
import 'package:healthapp/views/auth/signUp_view/rigestertion_view.dart';
import 'package:healthapp/views/auth/welcome_view/welcomView.dart';
import 'package:healthapp/views/home/views/homeView.dart';
import 'package:healthapp/views/home/views/settingscreen.dart';
import 'package:healthapp/views/home/views/shopView.dart';
import 'package:healthapp/main_app.dart';

bool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => GetDishesCubit(),
        ),
        BlocProvider(
          create: (context) => ShopViewCubit(),
        ),
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => UserRecordCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            onUnknownRoute: (settings) {
              if (settings.name == LoginView.loginViewID) {
                return MaterialPageRoute(
                    builder: (builder) => const LoginView(),
                    settings: settings);
              }
              return null;
            },
            onGenerateRoute: (settings) {
              if (settings.name == LoginView.loginViewID) {
                return MaterialPageRoute(
                    builder: (builder) => const LoginView(),
                    settings: settings);
              }
              return null;
            },
            home: islogin == true ? const mainapp() : const welcomeScreen(),
            theme: ThemeData(
                useMaterial3: false,
                primaryColor: const Color(0xFFFFDADA),
                primarySwatch: Colors.green),
            routes: {
              mainapp.id: (context) => const mainapp(),
              homeView.id: (context) => const homeView(),
              settingView.id: (context) => const settingView(),
              welcomeScreen.welcomeScreenID: (context) => const welcomeScreen(),
              OnBoardingScreen.onBoardingScreenID: (context) =>
                  const OnBoardingScreen(),
              LoginView.loginViewID: (context) => const LoginView(),
              SignUpview.signUpID: (context) => const SignUpview(),
              rigestrtionPage.rigestrtionId: (context) =>
                  const rigestrtionPage(),
              shopView.id: (context) => const shopView(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
