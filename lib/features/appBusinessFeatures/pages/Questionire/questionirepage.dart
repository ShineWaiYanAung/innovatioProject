import 'package:flutter/material.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final TextEditingController question1 = TextEditingController();
  final TextEditingController question2 = TextEditingController();
  final TextEditingController question3 = TextEditingController();
  final TextEditingController question4 = TextEditingController();
  final TextEditingController question5 = TextEditingController();

  // List to store the answers
  List<String> answers = [];

  // Track if a question has been answered
  List<bool> isAnswered = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    // Calculate progress (0.0 to 1.0) based on the number of answers
    double progress = answers.length / 5.0;

    // List of questions
    final List<QuestionModelModel> questions = [
      QuestionModelModel(question: "What is your name?", controller: question1),
      QuestionModelModel(question: "What is your age?", controller: question2),
      QuestionModelModel(question: "Where do you live?", controller: question3),
      QuestionModelModel(question: "What is your profession?", controller: question4),
      QuestionModelModel(question: "What is your hobby?", controller: question5),
    ];

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
                top: 100, // Adjust this value based on how much space you want from the top
                left: 0,
                right: 0,
                bottom: 0, // Allow it to take up the rest of the space
                child: ListView.builder(
                  itemCount: questions.length, // Use the actual number of questions
                  itemBuilder: (context, index) {
                    return buildQuestionnaireCard(context, index, questions);
                  },
                ),
              ),
              // Progress indicator at the top
              Positioned(
                top: 60, // Adjust this so the progress bar sits below the "To Get Better Result" text
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  color: Colors.blue,
                  backgroundColor: Colors.grey,
                  value: progress, // Pass progress value here
                  minHeight: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build the questionnaire card
  Widget buildQuestionnaireCard(BuildContext context, int index, List<QuestionModelModel> questions) {
    final eachQuestion = questions[index];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xff1B1B1B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xff1B1B1B),
              offset: Offset(0, 1),
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              eachQuestion.question, // Display question text
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white, // White text for questions
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 300,
              child: TextField(
                controller: eachQuestion.controller,
                decoration: InputDecoration(
                  hintText: 'Fill Me',
                  hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey, // Hint text color
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: isAnswered[index]
                  ? () {
                // If the question is answered, allow editing the answer
                setState(() {
                  isAnswered[index] = false; // Set it to false so they can edit
                });
              }
                  : () {
                // If the question is not answered, submit the answer
                if (eachQuestion.controller.text.isNotEmpty) {
                  if (!isAnswered[index]) {
                    answers.add(eachQuestion.controller.text);
                    isAnswered[index] = true; // Mark the question as answered
                    print("The Answer $index is ${eachQuestion.controller.text}");
                  }
                  setState(() {}); // Rebuild to update progress bar and UI
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isAnswered[index] ? Colors.grey : Colors.white, // Change color when answered
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff1B1B1B),
                      offset: Offset(0, 1),
                      blurRadius: 1,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  isAnswered[index] ? "Edit" : "Submit", // Change text when answered
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

class QuestionModelModel {
  final String question;
  final TextEditingController controller;

  QuestionModelModel({required this.question, required this.controller});
}
