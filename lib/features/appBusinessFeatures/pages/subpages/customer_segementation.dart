import 'package:flutter/material.dart';

class CustomerSegmentation extends StatefulWidget {
  const CustomerSegmentation({super.key});

  @override
  State<CustomerSegmentation> createState() => _CustomerSegmentationState();
}

class _CustomerSegmentationState extends State<CustomerSegmentation> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text("Welcome, CEO", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 300,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red

                ),
                child: Text("A"),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 3,
          ),



        ],

      ),
    );
  }
}
