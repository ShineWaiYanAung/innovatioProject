import 'package:flutter/material.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final List<String> questions = [
    "What is your name?",
    "How old are you?",
    "Where are you from?",
    "What is your favorite hobby?",
    "What is your favorite food?",
  ];

  int currentQuestionIndex = 0; // Track the current question
  int totalQuestions = 5; // Total number of questions

  @override
  Widget build(BuildContext context) {
    double progress = (currentQuestionIndex + 1) / totalQuestions;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              // Positioned "To Get Better Result" text at the top
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "To Get Better Result",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              // ListView.builder for the questionnaire
              Positioned(
                top:
                    100, // Adjust this value based on how much space you want from the top
                left: 0,
                right: 0,
                bottom: 0, // Allow it to take up the rest of the space
                child: ListView.builder(
                  itemCount:
                      questions.length, // Use the actual number of questions
                  itemBuilder: (context, index) {
                    return buildQuestionnaireCard(context, index);
                  },
                ),
              ),
              // Progress indicator at the top
              Positioned(
                top:
                    60, // Adjust this so the progress bar sits below the "To Get Better Result" text
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.grey,

                  value: progress,
                  minHeight: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestionnaireCard(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xff1B1B1B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color(0xff1B1B1B), offset: Offset(0, 1), blurRadius: 1),
          ],
        ),
        child: Column(
          children: [
            Text(
              "${index + 1}. ${questions[index]}", // Display question number and text
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white, // White text for questions
                  ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Fill Me',
                  hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey, // Hint text color
                      ),
                  filled: true,
                  fillColor: Colors.white, // Background color when focused
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when not focused
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue, // Border color when focused
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (currentQuestionIndex > 0) currentQuestionIndex--;


              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff1B1B1B),
                        offset: Offset(0, 1),
                        blurRadius: 1),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Submit",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// if (currentQuestionIndex > 0)
// ElevatedButton(
// onPressed: () {
// setState(() {
// currentQuestionIndex--;
// });
// },
// child: Text('Previous'),
// ),
// ElevatedButton(
// onPressed: () {
// setState(() {
// if (currentQuestionIndex < totalQuestions - 1) {
// currentQuestionIndex++;
// } else {
// // Submit the questionnaire
// showDialog(
// context: context,
// builder: (context) => AlertDialog(
// title: Text('All Questions Completed'),
// content: Text('Thank you for completing the questionnaire!'),
// actions: [
// TextButton(
// onPressed: () {
// Navigator.of(context).pop();
// },
// child: Text('OK'),
// ),
// ],
// ),
// );
// }
// });
// },
// child: Text(currentQuestionIndex < totalQuestions - 1
// ? 'Next'
//     : 'Submit'),
// ),
// ],
// ),
