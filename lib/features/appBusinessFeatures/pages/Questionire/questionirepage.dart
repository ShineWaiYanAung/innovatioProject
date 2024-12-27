import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/authentication/pages/mainScreen/login.dart';
import 'package:innovation_proeject/responsiveScreenControllerAbstract/parent_screen_controller.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  // Map to store the selected answers for each question
  Map<int, String> selectedAnswers = {};
  List<String> answers = [];

  @override
  Widget build(BuildContext context) {
    double progress = selectedAnswers.length / 6.0;

    // List of questions
    final List<QuestionModel> questions = [
      QuestionModel(
        question: "1.What industry does your business operate in?",
        multipleQuestion: [
          "Retail",
          "Manufacturing",
          "Wholesale",
          "Service (e.g., hospitality, healthcare)",
        ],
      ),
      QuestionModel(
        question: "2.What is the size of your business?",
        multipleQuestion: [
          "Small (1-10 employees)",
          "Medium (11-100 employees)",
          "Large (101+ employees)",
        ],
      ),
      QuestionModel(
        question: "3.What geographic area do you serve?",
        multipleQuestion: [
          "Local (city or town)",
          "Regional",
          "National",
          "International",
          "Online (E-commerce)",
        ],
      ),
      QuestionModel(
        question: "4.What are the biggest challenges your business is currently facing? (Optional)",
        multipleQuestion: [
          "Sales and revenue forecasting",
          "Real-time performance insights",
          "Inventory management",
          "Difficulty in making data-driven decisions",
        ],
      ),
      QuestionModel(
        question: "5.How do you primarily make business decisions today?",
        multipleQuestion: [
          "Data-driven insights",
          "Experience and intuition",
          "External consultants or advisors",
          "We don’t currently have a formal decision-making process",
        ],
      ),
      QuestionModel(
        question: "6.What key features would you like from FAB?",
        multipleQuestion: [
          "Sales forecasting and trend analysis",
          "AI-powered decision-making support",
          "Business insights and recommendations",
          "Inventory management predictions",
        ],
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Populate the answers list from selectedAnswers
          if (selectedAnswers.length <= 5) return;
          answers = List.generate(
            questions.length,
            (index) => selectedAnswers[index] ?? "Not Answered",
          );
          print(answers); // Debugging: Print the answers list
          // Add further actions if needed
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ),
          );
        },

        child: Icon(Icons.check,color: Colors.black,), // Changed icon to a checkmark for submission
      ),
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
                top: 100,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return buildQuestionnaireCard(
                        context, index, questions, questions[index].multipleQuestion);
                  },
                ),
              ),
              // Progress indicator at the top
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  color: Colors.blue,
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

  // Method to build the questionnaire card
  Widget buildQuestionnaireCard(BuildContext context, int index,
      List<QuestionModel> questions, List<String> answerChoices) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              eachQuestion.question,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 16),
            ...answerChoices.map((choice) => _buildRadioOption(index, choice)),
          ],
        ),
      ),
    );
  }

  // Method to build individual radio options
  Widget _buildRadioOption(int questionIndex, String value) {
    return RadioListTile<String>(
      activeColor: Colors.blue,
      title: Text(
        value,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      value: value,
      groupValue: selectedAnswers[questionIndex],
      onChanged: (newValue) {
        setState(() {
          selectedAnswers[questionIndex] = newValue!;

        });
      },
    );
  }
}

class QuestionModel {
  final String question;
  final List<String> multipleQuestion;
  QuestionModel({
    required this.question,
    required this.multipleQuestion,
  });
}
