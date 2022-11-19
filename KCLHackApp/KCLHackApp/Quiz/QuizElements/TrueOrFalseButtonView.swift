import UIKit

protocol TrueOrFalseSelectionDelegate: AnyObject {
    func didPressTrueOrFalseButton(question: String, prediction: String, answer: String, button: UIButton)
}

class TrueOrFalseButtonView: UIView {
    
    var trueButton = ChoiceButton()
    var falseButton = ChoiceButton()
    weak var delegate: TrueOrFalseSelectionDelegate?
    var answer: String = ""
    var question: String = ""
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 24
        stackView.addArrangedSubview(trueButton)
        stackView.addArrangedSubview(falseButton)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        trueButton.addText(text: "True", fontSize: 14, cornerRadius: 10)
        falseButton.addText(text: "False", fontSize: 14, cornerRadius: 10)
        
        trueButton.addPadding(5)
        falseButton.addPadding(5)
        
        trueButton.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(buttonStackView)
        
        buttonStackView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc func selectButton(_ sender: UIButton) {
        guard
            let answer1 = trueButton.titleLabel?.text,
            let answer2 = falseButton.titleLabel?.text
        else {
            print("guard error")
            return
        }
        
        switch sender {
        case trueButton:
            delegate?.didPressTrueOrFalseButton(question: question, prediction: answer1, answer: answer, button: trueButton)
        case falseButton:
            delegate?.didPressTrueOrFalseButton(question: question, prediction: answer2, answer: answer, button: falseButton)
        default:
            print("Must be an error here somewhere")
        }
    }
}
