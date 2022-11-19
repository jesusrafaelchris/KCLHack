import UIKit

class TrendsVC: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 40, text: "£407.29", bold: true)
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
    
    lazy var quizView: QuizView = {
        let quizView = QuizView()
        return quizView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
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
        view.addSubview(quizView)
        
        buttonStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        chartImage.makeHeight(size: 250)
        
        quizView.anchor(top: buttonStackView.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
    }
    
    

}
