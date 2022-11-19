import UIKit
import SPConfetti

class QuizViewController: UIViewController {
    
    var answers = [AnsweredQuestions]()
    var value = 0
    
    var quizQuestions: [Question] = [
        Question(question: "How much did you spend on nandos this week?", image: "🍔", answerType: QuestionTypes.multipleChoice, answer: "£300", choices: Choices(choice1: "£500", choice2: "£300", choice3: "£100")),
        Question(question: "You spent more on shopping than food this month, T or F?", image: "🛍️ 🙋 🍟", answerType: QuestionTypes.TrueOrFalse, answer: "True", choices: nil),
        Question(question: "How far through your budget are you?", image: "📊", answerType: QuestionTypes.slider, answer: "77", choices: nil),
        Question(question: "You spent £300 in one day, T or F?", image: "🚣", answerType: QuestionTypes.TrueOrFalse, answer: "True", choices: nil),
        Question(question: "What was your average spend per day?", image: "🤑", answerType: QuestionTypes.multipleChoice, answer: "£11.09", choices: Choices(choice1: "£25.43", choice2: "£11.09", choice3: "£45.33")),
    ]
    
    var indexPath = IndexPath(item: 1, section: 0)
    var index = 1
    
    lazy var progressView: ProgressView = {
        let view = ProgressView()
        return view
    }()
    
    lazy var quizCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(QuizCell.self, forCellWithReuseIdentifier: "quizCell")
        collectionview.backgroundColor = .clear
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.isScrollEnabled = false
        return collectionview
    }()
    
    lazy var errorMessage: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "Error", bold: true)
        text.textAlignment = .center
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        text.isHidden = true
        return text
    }()
    
    lazy var addBudget: AddBudgetView = {
        let addBudget = AddBudgetView()
        addBudget.isHidden = true
        return addBudget
    }()
    
    lazy var continueButton = WhiteBottomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        continueButton.isHidden = true
        continueButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scroll)))
        
        addBudget.plusButton.addTarget(self, action: #selector(increaseValue), for: .touchUpInside)
        addBudget.minusButton.addTarget(self, action: #selector(decreaseValue), for: .touchUpInside)
    }
    
    @objc func decreaseValue() {
        if value > 0 {
            value = value - 1
            addBudget.budgetValue.text = "\(value)"
        }
    }
    
    @objc func increaseValue() {
        value = value + 1
        addBudget.budgetValue.text = "\(value)"
    }
    
    
    func setupView() {
        view.addSubview(progressView)
        view.addSubview(quizCollectionView)
        quizCollectionView.addSubview(errorMessage)
        view.addSubview(addBudget)
        view.addSubview(continueButton)
        
        progressView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        quizCollectionView.anchor(top: view.topAnchor, paddingTop: 10, bottom: continueButton.topAnchor, paddingBottom: 10, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        errorMessage.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
        
        errorMessage.topAnchor.constraint(equalTo: quizCollectionView.centerYAnchor, constant: 180).isActive = true
        
        addBudget.anchor(top: errorMessage.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 90, right: view.rightAnchor, paddingRight: 90, width: 0, height: 0)
        
        continueButton.anchor(top: nil, paddingTop: 0,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10,
                              left: view.leftAnchor, paddingLeft: 32,
                              right: view.rightAnchor, paddingRight: 32,
                              width: 0, height: 48)
        
    }
    
    @objc func scroll() {
        if index < quizQuestions.count {
            SPConfetti.stopAnimating()
            continueButton.isHidden = true
            quizCollectionView.isUserInteractionEnabled = true
            progressView.resetAll()
            hideErrorMessage()
            hideAddBudget()
            progressView.views[self.indexPath.item].select()
            self.quizCollectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: false)
            index = index + 1
            self.indexPath = IndexPath(item: index, section: 0)
        }
        
        else {
            print("finished questions")
            let summary = SummaryViewController()
            summary.answers = answers
            self.navigationController?.pushViewController(summary, animated: true)
        }
    }
}

// MARK: CollectionView Methods

extension QuizViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizQuestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "quizCell",
            for: indexPath) as? QuizCell else { return UICollectionViewCell() }
        let data = quizQuestions[indexPath.item]
        cell.backgroundColor = .black
        
        switch data.answerType {
            //Multiple choice
        case .multipleChoice:
            cell.configureMultipleChoice(question: data.question, emoji: data.image, choices: data.choices!, answer: data.answer)
            cell.multipleChoiceButtons.delegate = self
            //True or false
        case .TrueOrFalse:
            cell.configureTrueFalseChoice(question: data.question, emoji: data.image, answer: data.answer)
            cell.trueOrFalseButtons.delegate = self
            // Slider
        case .slider:
            cell.configureSliderChoice(question: data.question, emoji: data.image, answer: "77")
            cell.sliderView.delegate = self
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height - 200
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }
}

extension QuizViewController: MultipleChoiceSelectionDelegate, TrueOrFalseSelectionDelegate, SliderSelectionDelegate {
    
    //Multiple Choice
    func didPressMultipleChoiceButton(question: String, prediction: String, answer: String, button: UIButton) {
        if prediction == answer {
            quizCollectionView.isUserInteractionEnabled = false
            button.backgroundColor = .green
            continueButton.isHidden = false
            SPConfettiConfiguration.particlesConfig.colors = [.green, .yellow]
            SPConfetti.startAnimating(.fullWidthToDown, particles: [.star], duration: 1)
            answers.append(AnsweredQuestions(questiontitle: question, correct: true))
        }
        else {
            showErrorMessage(error: "Because of your daily trips to Pret, your daily spending has gone up by 7.8%")
            button.backgroundColor = .red
            quizCollectionView.isUserInteractionEnabled = false
            continueButton.isHidden = false
            answers.append(AnsweredQuestions(questiontitle: question, correct: false))
        }
    }
    
    // True or False
    func didPressTrueOrFalseButton(question: String, prediction: String, answer: String, button: UIButton) {
        if prediction == answer {
            button.backgroundColor = .green
            continueButton.isHidden = false
            quizCollectionView.isUserInteractionEnabled = false
            SPConfettiConfiguration.particlesConfig.colors = [.green, .yellow]
            SPConfetti.startAnimating(.fullWidthToDown, particles: [.star], duration: 1)
            answers.append(AnsweredQuestions(questiontitle: question, correct: true))
        }
        else {
            showErrorMessage(error: "You really love to shop! Try setting a budget for your shopping to try to save some money on those Gucci shoes..")
            showAddBudget()
            button.backgroundColor = .red
            quizCollectionView.isUserInteractionEnabled = false
            continueButton.isHidden = false
            answers.append(AnsweredQuestions(questiontitle: question, correct: false))
        }
    }
    
    func didSelectSliderValue(question: String, prediction: String, answer: String, slider: UISlider) {
        if prediction <= "\(Int(answer) ?? 0 + 5)" || prediction >= "\(Int(answer) ?? 0 - 5)" {
            slider.tintColor = .green
            continueButton.isHidden = false
            quizCollectionView.isUserInteractionEnabled = false
            SPConfettiConfiguration.particlesConfig.colors = [.green, .yellow]
            SPConfetti.startAnimating(.fullWidthToDown, particles: [.star], duration: 1)
            answers.append(AnsweredQuestions(questiontitle: question, correct: true))
        }
        else {
            showErrorMessage(error: "Hello")
            slider.tintColor = .red
            continueButton.isHidden = false
            quizCollectionView.isUserInteractionEnabled = false
            answers.append(AnsweredQuestions(questiontitle: question, correct: false))
        }
    }
    
    func showErrorMessage(error: String) {
        errorMessage.isHidden = false
        errorMessage.text = error
    }
    
    func hideErrorMessage() {
        errorMessage.isHidden = true
    }
    
    func showAddBudget() {
        addBudget.isHidden = false
    }
    
    func hideAddBudget() {
        addBudget.isHidden = true
    }
    
}
