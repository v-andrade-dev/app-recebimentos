import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key,
      required this.title,
      required this.message,
      this.height = 50});

  final String title;
  final String message;
  final double height;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Card(
          //color: AppColors.primary.withOpacity(0.3),
          child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          height: widget.height,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.title),
                Text(widget.message),
              ]),
        ),
      )),
    );
  }
}
