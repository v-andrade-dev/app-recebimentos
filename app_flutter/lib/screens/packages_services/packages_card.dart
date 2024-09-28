import 'package:app_flutter/resource/app_colors.dart';
import 'package:flutter/material.dart';

class PackagesCard extends StatelessWidget {
  const PackagesCard(
      {super.key,
      required this.imageSource,
      required this.title,
      this.width = 200,
      this.height = 100});

  final String imageSource;
  final String title;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        //decoration: BoxDecoration(
        //border: Border.all(color: AppColors.secondary, width: 3)),
        child: Card(
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    //style: TextStyle(fontSize: 18),
                  ),
                  Image.asset(
                    imageSource,
                    width: width,
                    height: height,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
