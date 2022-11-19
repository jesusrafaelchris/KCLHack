import Foundation

struct Question {
    var question: String
    var image: String
    var answerType: QuestionTypes
    var answer: String
    var choices: Choices?
}

enum QuestionTypes {
    case multipleChoice
    case slider
    case TrueOrFalse
}
