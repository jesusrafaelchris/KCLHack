import UIKit

class QuizCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 20, text: "", bold: true)
        text.textAlignment = .center
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    lazy var emojiLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 80, text: "", bold: true)
        text.textAlignment = .center
        return text
    }()
    
    lazy var multipleChoiceButtons: MultipleChoiceButtonsView = {
        let view = MultipleChoiceButtonsView()
        return view
    }()
    
    lazy var trueOrFalseButtons: TrueOrFalseButtonView = {
        let view = TrueOrFalseButtonView()
        return view
    }()
    
    lazy var sliderView: SliderView = {
        let view = SliderView()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureMultipleChoice(question: String, emoji: String, choices: Choices, answer: String) {
        addSubview(multipleChoiceButtons)
        
        multipleChoiceButtons.anchor(top: centerYAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 16, right: rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        titleLabel.text = question
        emojiLabel.text = emoji
        multipleChoiceButtons.addChoices(choice1text: choices.choice1, choice2text: choices.choice2, choice3text: choices.choice3)
        multipleChoiceButtons.answer = answer
        multipleChoiceButtons.question = question
    }
    
    func configureTrueFalseChoice(question: String, emoji: String, answer: String) {
        addSubview(trueOrFalseButtons)
        
        trueOrFalseButtons.anchor(top: centerYAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 32, right: rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        titleLabel.text = question
        emojiLabel.text = emoji
        trueOrFalseButtons.answer = answer
        trueOrFalseButtons.question = question
    }
    
    func configureSliderChoice(question: String, emoji: String, answer: String) {
        addSubview(sliderView)
        
        sliderView.anchor(top: centerYAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 32, right: rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        titleLabel.text = question
        emojiLabel.text = emoji
        sliderView.answer = answer
        sliderView.question = question
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(emojiLabel)
        
        titleLabel.anchor(top: topAnchor, paddingTop: 60, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 32, right: rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        emojiLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 80, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 32, right: rightAnchor, paddingRight: 32, width: 0, height: 0)

    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {

        guard isUserInteractionEnabled else { return nil }

        guard !isHidden else { return nil }

        guard alpha >= 0.01 else { return nil }

        guard self.point(inside: point, with: event) else { return nil }


        // add one of these blocks for each button in our collection view cell we want to actually work
        if multipleChoiceButtons.choice1.point(inside: convert(point, to: multipleChoiceButtons.choice1), with: event) {
            return multipleChoiceButtons.choice1
        }
        
        if multipleChoiceButtons.choice2.point(inside: convert(point, to: multipleChoiceButtons.choice2), with: event) {
            return multipleChoiceButtons.choice2
        }
        
        if multipleChoiceButtons.choice3.point(inside: convert(point, to: multipleChoiceButtons.choice3), with: event) {
            return multipleChoiceButtons.choice3
        }
        
        if trueOrFalseButtons.trueButton.point(inside: convert(point, to: trueOrFalseButtons.trueButton), with: event) {
            return trueOrFalseButtons.trueButton
        }
        
        if trueOrFalseButtons.falseButton.point(inside: convert(point, to:  trueOrFalseButtons.falseButton), with: event) {
            return trueOrFalseButtons.falseButton
        }
        

        return super.hitTest(point, with: event)
    }
    
}
