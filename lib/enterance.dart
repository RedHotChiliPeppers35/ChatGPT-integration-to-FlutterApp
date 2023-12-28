import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF3c3c3c),
      appBar: AppBar(
        title: const Text("My GPT App"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            textWidget(
                "Welcome to GPT App",
                MediaQuery.of(context).size.height * 0.1,
                MediaQuery.of(context).size.width * 0.8),
            Column(
              children: [
                usernameOrPasswordField(
                    MediaQuery.of(context).size.width * 0.35,
                    MediaQuery.of(context).size.height * 0.07,
                    "Username",
                    false),
                SizedBox(
                  height: 15,
                ),
                usernameOrPasswordField(
                    MediaQuery.of(context).size.width * 0.35,
                    MediaQuery.of(context).size.height * 0.07,
                    "Password",
                    true)
              ],
            )
          ],
        ),
      )),
    );
  }
}

Widget usernameOrPasswordField(
    double width, double height, String nameOrPassword, bool isObsecure) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: TextField(
        cursorColor: Color(0XFF),
        obscureText: isObsecure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: nameOrPassword,
        ),
      ),
    ),
  );
}

Widget textWidget(String text, double height, double width) {
  return Container(
    height: height,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey.shade100, fontSize: 20),
          ),
        ),
        const SizedBox(width: 8),
        FlashingDots(),
      ],
    )),
  );
}

class FlashingDots extends StatefulWidget {
  @override
  _FlashingDotsState createState() => _FlashingDotsState();
}

class _FlashingDotsState extends State<FlashingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
      reverseDuration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: _controller.value < 0.2 ? 0.2 : _controller.value,
              child: const Text(
                '.',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Opacity(
              opacity: _controller.value < 0.4 ? 0.2 : _controller.value,
              child: const Text(
                '.',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Opacity(
              opacity: _controller.value < 0.6 ? 0.2 : _controller.value,
              child: const Text(
                '.',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
