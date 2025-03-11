import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shows a reward badge lizard style
class BadgePage extends StatelessWidget {
  /// Full page badge widget, showing the [rewardMessage] on top
  /// of a lizard animation and some stars
  const BadgePage({super.key, required this.rewardMessage});

  final String rewardMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Text(rewardMessage, style: GoogleFonts.vastShadow(textStyle: TextStyle(fontSize: 20)))
                .animate(delay: Duration(milliseconds: 200))
                .scale(curve: Curves.bounceOut, begin: Offset(2, 2), end: Offset(1, 1))
                .then()
                .shimmer(duration: Duration(milliseconds: 300)),

            /// Stacking the circle rotating background below the lizard
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SvgPicture.asset('assets/svg/circle.svg')
                    .animate(onComplete: (c) => c.repeat())
                    .rotate(curve: Curves.easeInOutBack, duration: Duration(seconds: 3)),
                SvgPicture.asset('assets/svg/head.svg'),
              ],
            ),

            /// Holds three stars, all animating on their own
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
                    )
                    .animate(onComplete: (c) => c.repeat(reverse: true))
                    .moveY(duration: Duration(milliseconds: 500), begin: -2, end: 2),
                SvgPicture.asset('assets/svg/star.svg', width: 70)
                    .animate(delay: Duration(milliseconds: 400))
                    .fadeIn(duration: Duration(milliseconds: 700))
                    .blur(
                      duration: Duration(milliseconds: 200),
                      begin: Offset(6, 6),
                      end: Offset.zero,
                    )
                    .animate(
                      delay: Duration(milliseconds: 200),
                      onComplete: (c) => c.repeat(reverse: true),
                    )
                    .moveY(duration: Duration(milliseconds: 500), begin: -2, end: 2),
                SvgPicture.asset('assets/svg/star.svg', width: 70)
                    .animate(delay: Duration(milliseconds: 600))
                    .fadeIn(duration: Duration(milliseconds: 700))
                    .blur(
                      duration: Duration(milliseconds: 200),
                      begin: Offset(6, 6),
                      end: Offset.zero,
                    )
                    .animate(
                      delay: Duration(milliseconds: 400),
                      onComplete: (c) => c.repeat(reverse: true),
                    )
                    .moveY(duration: Duration(milliseconds: 500), begin: -2, end: 2),
              ],

              /// Reward explanation text
            ),
            Text(
              'GOLD STATUS',
              style: GoogleFonts.vastShadow(textStyle: TextStyle(fontSize: 25)),
            ).animate(delay: Duration(milliseconds: 300)).shakeX(),
          ],
        ),
      ),
    );
  }
}
