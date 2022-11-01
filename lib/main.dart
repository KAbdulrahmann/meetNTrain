import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_n_train/cubit/app_cubit.dart';
import 'package:meet_n_train/screen/schdule_screen/schedule_screen.dart';
import 'package:meet_n_train/shared/theme/theme.dart';
import 'cubit/cubit_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // to set Appication in Portrait Mode only
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (BuildContext context) => AppCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MeetNTrain',
              // Theme Of Our App
              theme: MeetNTrainTheme.light,
              home: const SafeArea(child: ScheduleScreen()),
            ),
          );
        });
  }
}
