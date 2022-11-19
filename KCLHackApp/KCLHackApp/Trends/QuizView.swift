import UIKit

class QuizView: UIView {
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 12, text: "Fancy your chances in the weekly quiz?", bold: true)
        text.textAlignment = .left
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    lazy var emojiLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 30, text: "📋", bold: true)
        text.textAlignment = .left
        return text
    }()
    
    lazy var chevronButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "chevron.right", size: 14, colour: .black)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.addArrangedSubview(emojiLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(chevronButton)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = .white
        addSubview(emojiLabel)
        addSubview(titleLabel)
        addSubview(chevronButton)
        
        emojiLabel.anchor(top: topAnchor, paddingTop: 8, bottom: bottomAnchor, paddingBottom: 8, left: leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        titleLabel.anchor(top: topAnchor, paddingTop: 8, bottom: bottomAnchor, paddingBottom: 8, left: emojiLabel.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        
        chevronButton.anchor(top: topAnchor, paddingTop: 8, bottom: bottomAnchor, paddingBottom: 8, left: nil, paddingLeft: 8, right: rightAnchor, paddingRight: 0, width: 40, height: 40)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
