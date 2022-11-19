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
    
    lazy var rewardsLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 22, text: "Your Badges", bold: true)
        text.textAlignment = .center
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    lazy var emojiLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 70, text: "🥈", bold: true)
        text.textAlignment = .left
        return text
    }()
    
    lazy var badgeLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 22, text: "SuperSaver!", bold: true)
        text.textAlignment = .center
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    lazy var badgeDescription: UILabel = {
        let text = UILabel()
        text.layout(colour: .white.withAlphaComponent(0.4), size: 12, text: "You've achieved a median score of 87% over your quizzes... only 212 more points for a shiny metal card! 💳", bold: true)
        text.textAlignment = .left
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        quizView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openQuiz)))
    }
    
    func setupView() {
        view.addSubview(buttonStackView)
        view.addSubview(quizView)
        view.addSubview(rewardsLabel)
        view.addSubview(emojiLabel)
        view.addSubview(badgeLabel)
        view.addSubview(badgeDescription)
        
        buttonStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        chartImage.makeHeight(size: 250)
        
        quizView.anchor(top: buttonStackView.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        rewardsLabel.anchor(top: quizView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: nil, paddingRight: 0, width: 0, height: 0)
        
        emojiLabel.anchor(top: rewardsLabel.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: nil, paddingRight: 0, width: 0, height: 0)
        
        badgeLabel.anchor(top: rewardsLabel.bottomAnchor, paddingTop: 40, bottom: nil, paddingBottom: 0, left: emojiLabel.rightAnchor, paddingLeft: 24, right: nil, paddingRight: 0, width: 0, height: 0)
        
        badgeDescription.anchor(top: badgeLabel.bottomAnchor, paddingTop: 4, bottom: nil, paddingBottom: 0, left: emojiLabel.rightAnchor, paddingLeft: 24, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        
    }
    
    @objc func openQuiz() {
        let quiz = QuizViewController()
        let nav = UINavigationController(rootViewController: quiz)
        nav.modalPresentationStyle = .fullScreen
        self.navigationController?.present(nav, animated: true)
    }
    

}
