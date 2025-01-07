import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: ListView(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              child: ClipOval(
                child: Image.asset(
                  "onBoardingScreen/watch.jpg",
                  fit: BoxFit.scaleDown, // Makes sure the entire image fits
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Alexandar Crystal AC 6506 MCR",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard(context, "Total Sales", "1231202"),
                buildCard(context, "Revenue", "MMK 10k lakhs"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10), // Padding inside the container
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(30), // Circular border
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.3), // Light shadow for floating effect
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Review",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 20,),
                  buildStar(context,"5","200",20),
                  SizedBox(height: 10,),
                  buildStar(context,"4","100",40),
                  SizedBox(height: 10,),
                  buildStar(context,"3","50",90),
                  SizedBox(height: 10,),
                  buildStar(context,"2","20",100),
                  SizedBox(height: 10,),
                  buildStar(context,"1","10",130),
                  SizedBox(height: 20,),
                  Text(
                    "Average Rating is 4.5",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(height: 10,),
                  TextButton(
                    onPressed: (){}
                    ,
                    child: Text(
                      "Details",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildStar(BuildContext context,String star , String total, double percentage) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      star,
                      style:
                          Theme.of(context).textTheme!.titleMedium!.copyWith(
                              color: const Color(
                                0xffFFD700,
                              ),
                              fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(

                        margin: EdgeInsets.only(right: percentage), // Optional: adds margin if needed
                        decoration: BoxDecoration(
                          color: Color(0xffFFD700), // Gold color
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),


                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      total,
                      style: Theme.of(context)
                          .textTheme!
                          .titleMedium!
                          .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                    ),
                  ],
                );
  }

  Container buildCard(BuildContext context, String title, String quality) {
    return Container(
      width: 150,
      height: 120,
      padding: EdgeInsets.symmetric(
          horizontal: 15, vertical: 10), // Padding inside the container
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the container
        borderRadius: BorderRadius.circular(30), // Circular border
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.3), // Light shadow for floating effect
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Ensures the column size fits the content
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black, fontSize: 15)),
          SizedBox(height: 20), // Space between title and count
          Text(quality,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold)
              // Example count
              ),
        ],
      ),
    );
  }
}
