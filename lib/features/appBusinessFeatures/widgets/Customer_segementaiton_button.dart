
import 'package:flutter/material.dart';
class CustomerSegementaitonButton extends StatefulWidget {
  const CustomerSegementaitonButton({super.key});

  @override
  State<CustomerSegementaitonButton> createState() => _CustomerSegementaitonButtonState();
}

class _CustomerSegementaitonButtonState extends State<CustomerSegementaitonButton> {
  int selectedId = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(10),
      width: width,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xff292A2B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildDurationChange(selectedId, 0, context, "Seasonal", () {
            setState(() {
              selectedId = 0;
            });
          }),
          buildDurationChange(
            selectedId,
            1,
            context,
            "Loyal",
                () {
              setState(() {
                selectedId = 1;
              });
            },
          ),
          buildDurationChange(selectedId, 2, context, "Occassical", () {
            setState(() {
              selectedId = 2;
            });
          }),
        ],
      ),
    );
  }

  Widget buildDurationChange(int selectedID, int idColorChange,
      BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 70,
        decoration: BoxDecoration(
          color: selectedID == idColorChange ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: selectedID == idColorChange ? Colors.white : Colors.black,
              fontSize: 13),
        ),
      ),
    );
  }
}
