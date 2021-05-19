import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:quizapp/repository/apiconfiguration.dart';
import 'package:quizapp/ui/pages/Reset%20Password/add_mail.dart';
import 'package:quizapp/ui/pages/Reset%20Password/otp.dart';
import 'package:quizapp/ui/pages/Reset%20Password/reset_password.dart';
import 'package:quizapp/ui/pages/account.dart';
import 'package:quizapp/ui/pages/addCredit.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/changePassword.dart';
import 'package:quizapp/ui/pages/credithistory.dart';
import 'package:quizapp/ui/pages/dummyquizPage/quizpagee.dart';
import 'package:quizapp/ui/pages/editAccount.dart';
import 'package:quizapp/ui/pages/home.dart';
import 'package:quizapp/ui/pages/leaderboard.dart';
import 'package:quizapp/ui/pages/login.dart';
import 'package:quizapp/ui/pages/paywithCard.dart';
import 'package:quizapp/ui/pages/questionSubmitpage.dart';
import 'package:quizapp/ui/pages/quizDetailPage.dart';
import 'package:quizapp/ui/pages/settings.dart';
import 'package:quizapp/ui/pages/signup.dart';
import 'package:quizapp/ui/widgets/bottomNavBar.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await GlobalConfiguration().loadFromAsset("configuration");
  getApiLink();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Trivia',
      theme: ThemeData(
        primarySwatch: Colors.blueAccent[300],
        accentColor: Colors.indigo,
        fontFamily: "Montserrat",
        buttonColor: Colors.blueAccent[300],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: AuthenticationPage(),
      routes: {
        MyBottomNavigationBar.routeName: (ctx) => MyBottomNavigationBar(),
        Leaderboard.routeName: (ctx) => Leaderboard(),
        LoginPage.routeName: (ctx) => LoginPage(),
        SignupPage.routeName: (ctx) => SignupPage(),
        MyAccount.routeName: (ctx) => MyAccount(),
        HomePage.routeName: (ctx) => HomePage(),
        Settings.routeName: (ctx) => Settings(),
        AuthenticationPage.routeName: (ctx) => AuthenticationPage(),
        CreditHistory.routeName: (ctx) => CreditHistory(),
        AddCredit.routeName: (ctx) => AddCredit(),
        QuizDetailPage.routeName: (ctx) => QuizDetailPage(),
        DummyQuizPage.routeName: (ctx) => DummyQuizPage(),
        QuizSubmitPage.routeName: (ctx) => QuizSubmitPage(),
        EditAccount.routeNamne: (ctx) => EditAccount(),
        ChangePassword.routeName: (ctx) => ChangePassword(),
        AddMail.routeName: (ctx) => AddMail(),
        Otp.routeName: (ctx) => Otp(),
        ResetPassword.routeName: (ctx) => ResetPassword(),
      },
      builder: (context, child) =>
          ScrollConfiguration(behavior: AppBehavior(), child: child),
    );
  }
}

class AppBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // TODO: implement buildViewportChrome
    return child;
  }
}
