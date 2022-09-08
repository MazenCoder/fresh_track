import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../usecases/generateMaterialColor.dart';

class SlideTile extends StatelessWidget {
  final Widget image;
  final String title, desc;
  const SlideTile(
      {required this.image, required this.title, required this.desc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Padding(padding: const EdgeInsets.all(16), child: image),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FractionallySizedBox(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AutoSizeText(
                          title,
                          maxLines: 5,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.bold,
                            color: headlineColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      AutoSizeText(
                        desc,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.normal,
                          color: subHeadlineColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
