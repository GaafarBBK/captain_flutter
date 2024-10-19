import 'package:flutter/material.dart';
import 'package:captain11/screen/gender_toggle_switch.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "تدرب في أي وقت ومن أي مكان",
          body:
              "حقق أهدافك البدنية مع برامج تدريب متاحة في أي وقت وأينما كنت. ابدأ رحلة اللياقة البدنية الخاصة بك الآن.",
          image: buildImage('assets/intro1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "برامج تدريب مخصصة",
          body:
              "اختر من بين مجموعة من البرامج المصممة خصيصًا لتناسب مستوى لياقتك وأهدافك الشخصية.",
          image: buildImage('assets/onboarding/intro2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "ابدأ التغيير اليوم",
          body:
              "انضم إلى مجتمعنا الرياضي الآن وابدأ تحسين قوتك ولياقتك مع أفضل المدربين والمحتوى الحصري.",
          image: buildImage('assets/intro3.png'),
          decoration: getPageDecoration(),
        ),
      ],
      onDone: () => goToHome(context),
      onSkip: () => goToHome(context),
      showSkipButton: true,
      skip: const Text("تخطي"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("تم", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: getDotsDecorator(),
    );
  }

  void goToHome(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => GenderToggleSwitch()),
    );
  }

  Widget buildImage(String path) {
    return Center(child: Image.asset(path, width: 350));
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20.0),
      imagePadding: EdgeInsets.all(24),
      pageColor: Colors.white,
    );
  }

  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      size: Size(10.0, 10.0),
      color: Colors.grey,
      activeSize: Size(22.0, 10.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}


