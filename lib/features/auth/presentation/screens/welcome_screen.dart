import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  static const _logoPath = 'assets/images/travelmind_logo.png';
  static const _heroPath = 'assets/images/welcome_hero.png';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                flex: 48,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(26, 10, 26, 0),
                    child: Image.asset(
                      _logoPath,
                      width: size.width * 0.86,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const Expanded(flex: 52, child: _WelcomeHero()),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeHero extends StatelessWidget {
  const _WelcomeHero();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          WelcomeScreen._heroPath,
          fit: BoxFit.fitHeight,
          alignment: Alignment.bottomCenter,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0x00FFFFFF),
                Color(0x00274E80),
                Color(0xFF061D38),
              ],
              stops: [0, 0.16, 0.58, 1],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const _PageIndicator(),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2FD0D1), Color(0xFF1C62D3)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0A3A77).withValues(alpha: 0.22),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Text.rich(
                TextSpan(
                  text: 'Explore the world smarter with ',
                  children: [
                    TextSpan(
                      text: 'TravelMind.',
                      style: TextStyle(
                        color: const Color(0xFF2FD0D1).withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.86),
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _IndicatorDot(isActive: true),
        SizedBox(width: 5),
        _IndicatorDot(),
        SizedBox(width: 5),
        _IndicatorDot(),
      ],
    );
  }
}

class _IndicatorDot extends StatelessWidget {
  const _IndicatorDot({this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: isActive ? 8 : 6,
      height: isActive ? 8 : 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: isActive ? 0.94 : 0.38),
      ),
    );
  }
}
