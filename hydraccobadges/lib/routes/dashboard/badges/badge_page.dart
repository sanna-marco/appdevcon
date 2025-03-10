import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({super.key, required this.rewardMessage});

  final String rewardMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              'YOU. DRANK. A. LOT!',
              style: GoogleFonts.vastShadow(textStyle: TextStyle(fontSize: 20)),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/circle.svg',
                ).animate(onComplete: (c) => c.repeat()).rotate(duration: Duration(seconds: 5)),
                SvgPicture.asset('assets/svg/head.svg'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                SvgPicture.asset('assets/svg/star.svg', width: 70)
                    .animate(delay: Duration(milliseconds: 200))
                    .fadeIn(duration: Duration(milliseconds: 700))
                    .blur(
                      duration: Duration(milliseconds: 200),
                      begin: Offset(6, 6),
                      end: Offset.zero,
                    ),
                SvgPicture.asset('assets/svg/star.svg', width: 70)
                    .animate(delay: Duration(milliseconds: 400))
                    .fadeIn(duration: Duration(milliseconds: 700))
                    .blur(
                      duration: Duration(milliseconds: 200),
                      begin: Offset(6, 6),
                      end: Offset.zero,
                    ),
                SvgPicture.asset('assets/svg/star.svg', width: 70)
                    .animate(delay: Duration(milliseconds: 600))
                    .fadeIn(duration: Duration(milliseconds: 700))
                    .blur(
                      duration: Duration(milliseconds: 200),
                      begin: Offset(6, 6),
                      end: Offset.zero,
                    ),
              ],
            ),
            Text('GOLD STATUS', style: GoogleFonts.vastShadow(textStyle: TextStyle(fontSize: 25))),
          ],
        ),
      ),
    );
  }
}
