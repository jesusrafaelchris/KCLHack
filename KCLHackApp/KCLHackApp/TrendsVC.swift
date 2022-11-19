import UIKit

class TrendsVC: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 30, text: "£407.29", bold: true)
        text.textAlignment = .center
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    lazy var subtitleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 12, text: "Total spent this week", bold: true)
        text.textAlignment = .left
        return text
    }()
    
    lazy var chartImage: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "Chart.png")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(chartImage)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
    }
    
    func setupView() {
        view.addSubview(buttonStackView)
        
        buttonStackView.anchor(top: view?.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view?.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
    }
    
    

}
