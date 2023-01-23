// ignore_for_file: deprecated_member_use, avoid_print, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:post_app/Home.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Sign in',
              body:
                  'when u install the box, get your login credentials and sign in',
              image: buildImage('assets/undraw_Access_account_re_8spm.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'notification',
              body: 'Activate notification,to receive data from box',
              image: buildImage('assets/undraw_Push_notifications_re_t84m.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Check Box',
              body: 'Check your box, pickup your bills newsletters',
              image: buildImage('assets/undraw_Newsletter_re_wrob.png'),
              footer: FlatButton(
                minWidth: 200,
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: Colors.purple)),
                onPressed: () => goHome(context),
                child: Text(
                  'Skip',
                  style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          done:
              const Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goHome(context),
          showDoneButton: false,
          showSkipButton: false,
          showNextButton: false,
          skip: const Text('Skip'),
          onSkip: () => goHome(context),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: const Color(0xffffffff),
          skipOrBackFlex: 0,
          nextFlex: 0,
          baseBtnStyle: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
          skipStyle: TextButton.styleFrom(
            primary: const Color(0x5C0099),
          ),
        ),
      );

  void goHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Home()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        activeColor: Colors.purple,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.w800),
        bodyTextStyle:
            GoogleFonts.hind(fontSize: 20, fontWeight: FontWeight.w300),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
