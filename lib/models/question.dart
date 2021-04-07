enum Type { multiple, boolean }

enum Difficulty { easy, medium, hard }

class Question {
  final String categoryName;
  final Type type;
  final Difficulty difficulty;
  final String question;
  final String image;
  final String correctAnswer;
  final String wrong1;
  final String wrong2;
  final String wrong3;
//  final List<dynamic> incorrectAnswers;

  Question(
    this.image,
    this.wrong1,
    this.wrong2,
    this.wrong3, {
    this.categoryName,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    // this.incorrectAnswers,
  });

  Question.fromMap(Map<String, dynamic> data)
      : categoryName = data["category"],
        image = data["media"],
        
        type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
        difficulty = data["difficulty"] == "easy"
            ? Difficulty.easy
            : data["difficulty"] == "medium"
                ? Difficulty.medium
                : Difficulty.hard,
        question = data["question"],
        correctAnswer = data["answer1"],
        //incorrectAnswers = data["option1"];
        wrong1 = data["option1"],
        wrong2 = data["option2"],
        wrong3 = data["option3"];

  static List<Question> fromData(List<Map<String, dynamic>> data) {
    return data.map((question) => Question.fromMap(question)).toList();
  }
}
