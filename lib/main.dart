import 'package:customcalendar/Components/Colors.dart';
import 'package:customcalendar/Components/customCalendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Custom Calendar',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
              useMaterial3: true),
          home: CalendarView(),
        );
      },
    );
  }
}

class CalendarView extends StatefulWidget {
  CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  // final TextEditingController _dateShow = TextEditingController();

  int daysToShow = 7;

  void updateDaysToShow(String newValue) {
    if (newValue.isNotEmpty) {
      daysToShow = int.parse(newValue);
    }
  }

  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          "CUSTOM CALENDAR VIEW",
          style: TextStyle(
              color: purple,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.h), child: Divider()),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          // Calendar View Widget
          customCalendar(dateShow: daysToShow, selectedValue: selectedValue),
          // SizedBox(
          //   height: 20.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.w),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Default days to show = 7",
          //         style: TextStyle(
          //             color: purple,
          //             fontSize: 15.sp,
          //             fontWeight: FontWeight.w400,
          //             letterSpacing: -0.5),
          //       ),
          //       SizedBox(
          //         height: 12.h,
          //       ),
                // customTextField(
                //     onChanged: (value) {
                //       setState(() {
                //         if (value.isNotEmpty) {
                //           daysToShow = int.parse(value);
                //         } else {
                //           daysToShow = 7;
                //         }
                //       });
                //     },
                //     // controller: _dateShow,
                //     hint: "Total date to show",
                //     obsecureText: false),
                // SizedBox(
                //   height: 12.h,
                // ),
                // Ink(
                //   padding: EdgeInsets.symmetric(vertical: 12.h),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(7.r),
                //   ),
                //   child: Theme(
                //     data: ThemeData(
                //         splashColor: Colors.transparent,
                //         highlightColor: Colors.transparent),
                //     child: RadioListTile(
                //       title: Text(
                //         "Enable OnTap",
                //         style: TextStyle(
                //             fontWeight: FontWeight.w500,
                //             letterSpacing: -0.4,
                //             color: black,
                //             fontSize: 12.sp),
                //       ),
                //       activeColor: Colors.black,
                //       value: "enable",
                //       groupValue: selectedValue,
                //       onChanged: (value) {
                //         setState(() {
                //           selectedValue = value!;
                //         });
                //       },
                //     ),
                //   ),
                // ),
                // Ink(
                //   padding: EdgeInsets.symmetric(vertical: 12.h),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(7.r),
                //   ),
                //   child: Theme(
                //     data: ThemeData(
                //         splashColor: Colors.transparent,
                //         highlightColor: Colors.transparent),
                //     child: RadioListTile(
                //       title: Text(
                //         "Disable OnTap",
                //         style: TextStyle(
                //             fontWeight: FontWeight.w500,
                //             letterSpacing: -0.4,
                //             color: black,
                //             fontSize: 12.sp),
                //       ),
                //       activeColor: Colors.black,
                //       value: "disable",
                //       groupValue: selectedValue,
                //       onChanged: (value) {
                //         setState(() {
                //           selectedValue = value!;
                //         });
                //       },
                //     ),
                //   ),
                // ),
          //     ],
          //   ),
          // )
        ],
      )),
    );
  }
}
