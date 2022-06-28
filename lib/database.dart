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
    "question": "Which Programming language is used by Flutter?",
    "options": ['Ruby', 'Kotlin', 'Dart', 'Java'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Which is our National Flower?",
    "options": ['Lily', 'Sunflower', 'Rose', 'Lotus'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Which is not a Blood Group?",
    "options": ['O', 'C', 'B', 'AB'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": " What is the Capital of India?",
    "options": ['Mumbai', 'Bangalore', 'New Delhi', 'Chennai'],
    "answer_index": 2,
  },
];
