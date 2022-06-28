class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "What is the value of pi?",
    "options": ['22/7', '31/4', '21/8', '51/2'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "2+2 is equal to?",
    "options": ['1', '2', '3', '4'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "what is our national flower?",
    "options": ['lily', 'Sunflower', 'Rose', 'Lotus'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": " How many days are there in a week?",
    "options": ['7', '6', '8', '5'],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": " What is the capital of India?",
    "options": ['Mumbai', 'Bangalore', 'New Delhi', 'Chennai'],
    "answer_index": 2,
  },
];
