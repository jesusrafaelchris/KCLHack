import UIKit

class SummaryCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "", bold: true)
        text.textAlignment = .left
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    lazy var emojiLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 20, text: "", bold: true)
        text.textAlignment = .center
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(question: String, correct: Bool) {
        titleLabel.text = question
        emojiLabel.text = correct ? "✅" : "❌"
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(emojiLabel)
        
        titleLabel.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        
        emojiLabel.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
    }
    
}
