import UIKit

class PotView: UIView {
    
    lazy var amountLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 30, text: "£12", bold: true)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var emojiLabel: UILabel = {
        let emoji = UILabel()
        emoji.layout(colour: .white, size: 70, text: "💰", bold: true)
        emoji.translatesAutoresizingMaskIntoConstraints = false
        return emoji
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        setUpView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.purple.cgColor, UIColor.systemPink.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
    
    
    func setUpView() {
        addSubview(amountLabel)
        addSubview(emojiLabel)
        
       // amountLabel.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        amountLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40).isActive = true
        amountLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        emojiLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25).isActive = true
        emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
