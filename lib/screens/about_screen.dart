import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wsize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              // color: Colors.red[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: wsize * 0.5,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: wsize * 0.5 - 25,
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.jpg'),
                    ),
                  ),
                  Text(
                    'James Bond',
                    style: GoogleFonts.rubik(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Actively looking',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text('Applied'),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '99',
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Reviewed'),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '26',
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Contacted'),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '12',
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.orange[100],
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Complete Profile',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () async {
                                //linkedin
                                final Uri uri = Uri.parse(
                                    'https://www.facebook.com/dicksorianolomibao');
                                if (!await launchUrl(uri)) {
                                  print('cannot open url');
                                }
                              },
                              child: FaIcon(FontAwesomeIcons.arrowRightLong),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri uri = Uri.parse('tel:+639191237458');
                            if (!await launchUrl(uri)) {
                              print('cannot open url');
                            }
                          },
                          child: FaIcon(FontAwesomeIcons.phone),
                        ),
                      ],
                    ),
                    const Text('Personal | Experiences | Job Certification')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
