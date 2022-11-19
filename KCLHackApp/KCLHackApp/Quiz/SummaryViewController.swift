import UIKit

class SummaryViewController: UIViewController {
    
    var answers = [AnsweredQuestions]()
    
    lazy var percentageLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 50, text: "60%", bold: true)
        text.textAlignment = .center
        return text
    }()
    
    lazy var achievementLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 14, text: "You're getting there!", bold: false)
        text.textAlignment = .center
        return text
    }()
    
    lazy var emojiLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 100, text: "🥈", bold: true)
        text.textAlignment = .center
        return text
    }()
    
    lazy var dateLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 10, text: "19.11.2022", bold: false)
        text.textAlignment = .center
        return text
    }()
    
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.addArrangedSubview(percentageLabel)
        stackView.addArrangedSubview(achievementLabel)
        stackView.addArrangedSubview(emojiLabel)
        stackView.addArrangedSubview(dateLabel)
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 22, text: "Summary", bold: true)
        text.textAlignment = .left
        return text
    }()
    
    lazy var quizCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(SummaryCell.self, forCellWithReuseIdentifier: "summaryCell")
        collectionview.backgroundColor = .clear
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.isScrollEnabled = false
        return collectionview
    }()
    
    
    lazy var continueButton: WhiteBottomButton = {
        let button = WhiteBottomButton()
        button.setTitle("Finish", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        continueButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(finishQuiz)))
    }
    
    func setupView() {
        view.addSubview(labelStackView)
        view.addSubview(titleLabel)
        view.addSubview(quizCollectionView)
        view.addSubview(continueButton)
        
        labelStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        titleLabel.anchor(top: labelStackView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        quizCollectionView.anchor(top: titleLabel.bottomAnchor, paddingTop: 30, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        continueButton.anchor(top: nil, paddingTop: 0,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10,
                              left: view.leftAnchor, paddingLeft: 32,
                              right: view.rightAnchor, paddingRight: 32,
                              width: 0, height: 48)
    }

    @objc func finishQuiz() {
        self.dismiss(animated: true)
    }
}

// MARK: CollectionView Methods

extension SummaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "summaryCell",
            for: indexPath) as? SummaryCell else { return UICollectionViewCell() }
        let data = answers[indexPath.item]
        cell.configure(question: data.questiontitle, correct: data.correct)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = CGFloat(44)//view.bounds.height / 15
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
