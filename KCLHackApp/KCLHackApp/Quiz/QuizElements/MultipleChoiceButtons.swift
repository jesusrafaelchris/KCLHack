import UIKit

protocol MultipleChoiceSelectionDelegate: AnyObject {
    func didPressMultipleChoiceButton(question: String, prediction: String, answer: String, button: UIButton)
}

class MultipleChoiceButtonsView: UIView {
    
    private var buttons = [UIButton]()
    weak var delegate: MultipleChoiceSelectionDelegate?
    var answer: String = ""
    var question: String = ""
    
    var choice1 = ChoiceButton()
    var choice2 = ChoiceButton()
    var choice3 = ChoiceButton()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubview(choice1)
        stackView.addArrangedSubview(choice2)
        stackView.addArrangedSubview(choice3)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttons = [choice1, choice2, choice3]
        choice1.addPadding(5)
        choice2.addPadding(5)
        choice3.addPadding(5)
        setupView()
        
        for button in buttons {
            button.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addChoices(choice1text: String, choice2text: String, choice3text: String) {
        choice1.addText(text: choice1text, fontSize: 18, cornerRadius: 5)
        choice2.addText(text: choice2text, fontSize: 18, cornerRadius: 5)
        choice3.addText(text: choice3text, fontSize: 18, cornerRadius: 5)
    }
    
    func setupView() {
        addSubview(buttonStackView)
        
        buttonStackView.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 16, right: rightAnchor, paddingRight: 16, width: 0, height: 0)
    }
    
    @objc func selectButton(_ sender: UIButton) {
        guard
            let answer1 = choice1.titleLabel?.text,
            let answer2 = choice2.titleLabel?.text,
            let answer3 = choice3.titleLabel?.text
        else {
            print("guard error")
            return
        }
        
        switch sender {
        case choice1:
            delegate?.didPressMultipleChoiceButton(question: question, prediction: answer1, answer: answer, button: choice1)
        case choice2:
            delegate?.didPressMultipleChoiceButton(question: question, prediction: answer2, answer: answer, button: choice2)
        case choice3:
            delegate?.didPressMultipleChoiceButton(question: question, prediction: answer3, answer: answer, button: choice3)
        default:
            print("Must be an error here somewhere")
        }
    }
}
