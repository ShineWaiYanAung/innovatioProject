import 'package:flutter/material.dart';

class DataImportButton extends StatelessWidget {
  final String name;
  final VoidCallback function;
  final Color textColor;
  final List<Color> gradient;
  final Icon icon;
  const DataImportButton({
    super.key,
    required this.function,
    required this.name,
    required this.textColor,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: gradient),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(fontFamily: "InriaSerif", color: textColor,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
