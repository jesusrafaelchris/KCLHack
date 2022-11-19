import UIKit

class PurchasesCell: UICollectionViewCell {
    
    lazy var emojiView: UILabel = {
        let imageView = UILabel()
        imageView.layout(colour: .white, size: 34, text: "🎃", bold: true)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "Food", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 14, text: "McDonald's", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var featuredStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var amountLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "56", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: purchase) {
        if data.amount.starts(with: "+") {
            amountLabel.text = data.amount
            amountLabel.textColor = .systemGreen
        } else {
            amountLabel.text = data.amount
            amountLabel.textColor = .white
        }
        emojiView.text = data.emoji
        titleLabel.text = data.category
        descriptionLabel.text = data.name

    }
    
    func setupView() {
        addSubview(emojiView)
        addSubview(featuredStackView)
        addSubview(amountLabel)
        
        emojiView.anchor(top: topAnchor, paddingTop: 6, bottom: bottomAnchor, paddingBottom: 6, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 44, height: 44)
        
        featuredStackView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: emojiView.rightAnchor, paddingLeft: 14, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        featuredStackView.centerYAnchor.constraint(equalTo: emojiView.centerYAnchor).isActive = true
        
        amountLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 30, width: 0, height: 0)
        amountLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
