import UIKit

class FriendsCell: UICollectionViewCell {
    
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
    
    lazy var rankLabel: UILabel = {
        let rank = UILabel()
        rank.layout(colour: .red, size: 14, text: "1", bold: true)
        rank.backgroundColor = .orange
        rank.layer.cornerRadius = 7.5
        rank.layer.masksToBounds = true
        rank.textAlignment = .center
        rank.translatesAutoresizingMaskIntoConstraints = false
        return rank
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
    
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 16, text: "69%", bold: true)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: friend) {
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.name
        descriptionLabel.text = data.saverStatus
        percentLabel.text = data.num
        rankLabel.text = data.rank
    }
    
    func setupView() {
        addSubview(rankLabel)
        addSubview(imageView)
        addSubview(featuredStackView)
        addSubview(percentLabel)
        
        rankLabel.anchor(top: imageView.topAnchor, paddingTop: -2, bottom: nil, paddingBottom: 1, left: nil, paddingLeft: 0, right: imageView.rightAnchor, paddingRight: -10, width: 15, height: 15)
        
        imageView.anchor(top: topAnchor, paddingTop: 6, bottom: bottomAnchor, paddingBottom: 6, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 44, height: 44)
        
        featuredStackView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: imageView.rightAnchor, paddingLeft: 14, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        featuredStackView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        percentLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
