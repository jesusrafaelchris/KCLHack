import UIKit

class GroupsCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Polygon")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 18, text: "Polygon X EasyA", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 14, text: "Technology, Hackathon", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var featuredStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var chevronButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "chevron.right", size: 14, colour: .white)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: group) {
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.name
        descriptionLabel.text = data.memberCount
    }
    
    func setupView() {
        addSubview(imageView)
        addSubview(featuredStackView)
        addSubview(chevronButton)
        
        imageView.anchor(top: topAnchor, paddingTop: 6, bottom: bottomAnchor, paddingBottom: 6, left: leftAnchor, paddingLeft: 18, right: nil, paddingRight: 0, width: 44, height: 44)
        
        featuredStackView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: imageView.rightAnchor, paddingLeft: 14, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        featuredStackView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        chevronButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 30, width: 0, height: 0)
        chevronButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
