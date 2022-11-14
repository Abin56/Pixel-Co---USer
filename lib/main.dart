import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pixels_user/controller/hive/database_hive.dart';
import 'package:pixels_user/controller/phone_otp_Bloc/auth_cubit.dart';
import 'package:pixels_user/controller/phone_otp_Bloc/auth_state.dart';
import 'package:pixels_user/view/home/widget/navigation_bar.dart';
import 'package:pixels_user/view/loginpage/login_screen.dart';
import 'package:pixels_user/view/splashscreen/splash_screen.dart';

import 'firebase_options.dart';
import 'view/colors/color.dart';

late Box<DBUserFavourites> userDataBase;

void main() async {
  ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DBUserFavouritesAdapter().typeId)) {
    Hive.registerAdapter(DBUserFavouritesAdapter());
  }
  userDataBase = await Hive.openBox<DBUserFavourites>('studentlist');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360.0, 784.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: GetMaterialApp(
              title: "Pixcles",
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 36, 44, 59),
                ),
                scaffoldBackgroundColor: const Color.fromARGB(255, 36, 44, 59),
                primarySwatch: Colors.blue,
                textTheme: TextTheme(
                  bodyText1: GoogleFonts.montserrat(
                      color: whitecolor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                  bodyText2: GoogleFonts.montserrat(
                      color: whitecolor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                ),
              ),
              home: BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (oldstate, newstate) {
                  return oldstate is AuthInitialState;
                },
                builder: (context, state) {
                  if (state is AuthLoggedInState) {
                    return const NavigationBarContoller();
                  } else if (state is AuthLoggedOutState) {
                    return const ScreenLogin();
                  } else {
                    return const SplashScreen();
                  }
                },
              ),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
