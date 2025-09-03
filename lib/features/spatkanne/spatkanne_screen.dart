import 'dart:math';
import 'package:flutter/material.dart';

class SpatkanneScreen extends StatefulWidget {
  const SpatkanneScreen({super.key});

  @override
  State<SpatkanneScreen> createState() => _SpatkanneScreenState();
}

class _SpatkanneScreenState extends State<SpatkanneScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  double top = 0;
  double left = 0;
  bool clicked = false;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      setState(() {
        top = size.height / 2;
        left = size.width / 2 + 90;
      });
    });
  }

  void moveNoButton(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      left = random.nextDouble() * (size.width - 140);
      top = random.nextDouble() * (size.height - 240);
    });
  }

  void goToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // 1 страница
                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Ці вы пойдзеце на спатканне?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Button(
                              text: 'Так',
                              color: Colors.pinkAccent,
                              onPressed: goToNextPage,
                            ),
                            const SizedBox(width: 30),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: !clicked,
                              child: Button(
                                text: 'Не',
                                color: Colors.purpleAccent,
                                onPressed: () {
                                  clicked = true;
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (clicked)
                      Positioned(
                        top: top,
                        left: left,
                        child: Button(
                          text: "Не",
                          color: Colors.deepPurple,
                          onPressed: () {
                            moveNoButton(context);
                          },
                        ),
                      ),
                  ],
                ),
                // 2 страница
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Вы абралі 'Так'! 💖",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          text: "Назад",
                          color: Colors.deepPurple,
                          onPressed: goToPreviousPage,
                        ),
                        const SizedBox(width: 20),
                        Button(
                          text: "Далей",
                          color: Colors.pinkAccent,
                          onPressed: goToNextPage,
                        ),
                      ],
                    ),
                  ],
                ),
                // 3 страница
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "http://mirchudes.net/uploads/posts/2015-12/1449391771_cherepoveckie-bolota.jpg",
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "📍 Месца сустрэчы: Бераг балота\n\n🕖 Час: Раніца ці Вечар\n\nНе забудзьцеся на гумовыя боты! 😉",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Button(
                      text: "Назад",
                      color: Colors.deepPurple,
                      onPressed: goToPreviousPage,
                    ),
                  ],
                ),
              ],
            ),
            // Индикаторы
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentPage == index ? 16 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          _currentPage == index ? Colors.white : Colors.white54,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  const Button({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          elevation: 8,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}
