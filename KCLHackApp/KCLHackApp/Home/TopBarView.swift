import UIKit

class TopBarView: UIView {

    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Member2")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()

    lazy var dateLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .lightGray, size: 14, text: "Welcome back", bold: false)
        return text
    }()

    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "Hi, Christian!", bold: true)
        return text
    }()
    
    lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "bell.badge", size: 14, colour: .white)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(titleLabel)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(dateLabel)
        addSubview(titleLabel)
        addSubview(notificationButton)
        
        profileImage.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        dateLabel.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: profileImage.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        titleLabel.anchor(top: dateLabel.bottomAnchor, paddingTop: 4, bottom: bottomAnchor, paddingBottom: 0, left: profileImage.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        notificationButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 10, width: 0, height: 0)
        notificationButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
