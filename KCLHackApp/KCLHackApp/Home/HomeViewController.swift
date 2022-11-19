import UIKit

class HomeViewController: UIViewController {
    
    var purchases = [purchase]()
    
    lazy var topBarView: TopBarView = {
        let topBarView = TopBarView()
        return topBarView
    }()
    
    lazy var currLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 16, text: "Current Account", bold: true)
        return text
    }()
    
    lazy var poundLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 38, text: "£", bold: false)
        return text
    }()
    
    lazy var intLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 62, text: "295", bold: false)
        return text
    }()

    lazy var decLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 38, text: ".95", bold: false)
        return text
    }()
    
    lazy var buttons: GrayButtonsView = {
        let button = GrayButtonsView()
        return button
    }()
    
    lazy var purchaseCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(PurchasesCell.self, forCellWithReuseIdentifier: "purchaseCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    lazy var todayLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 20, text: "Today", bold: true)
        return text
    }()

    lazy var totalLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .gray, size: 16, text: "£894,83", bold: true)
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        purchases = [
            purchase(emoji: "🍟", category: "McDonald's", name: "Food", amount: "-£12.22"),
            purchase(emoji: "💷", category: "Zara", name: "Refund", amount: "+£43.71"),
            purchase(emoji: "✈️", category: "Air France", name: "Travel", amount: "-£398.36"),
            purchase(emoji: "🛒", category: "Sainsbury's", name: "Groceries", amount: "-£197.13"),
            purchase(emoji: "💰", category: "BlackRock", name: "Salary", amount: "+£4089.24")
        ]
    }
    
//    let quiz = QuizViewController()
//    let nav = UINavigationController(rootViewController: quiz)
//    nav.modalPresentationStyle = .fullScreen
//    self.navigationController?.present(nav, animated: true)

    func setUpView(){
        view.addSubview(topBarView)
        view.addSubview(currLabel)
        view.addSubview(poundLabel)
        view.addSubview(intLabel)
        view.addSubview(decLabel)
        
        view.addSubview(buttons)
        
        view.addSubview(todayLabel)
        view.addSubview(totalLabel)
        
        view.addSubview(purchaseCollectionView)
        
        
        
        topBarView.anchor(top: view.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        currLabel.anchor(top: view.topAnchor, paddingTop: 170, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        currLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        poundLabel.anchor(top: view.topAnchor, paddingTop: 190, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 90, right: nil, paddingRight: 0, width: 0, height: 0)
        
        intLabel.anchor(top: view.topAnchor, paddingTop: 185, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 120, right: nil, paddingRight: 0, width: 0, height: 0)
        
        decLabel.anchor(top: view.topAnchor, paddingTop: 190, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 235, right: nil, paddingRight: 0, width: 0, height: 0)
        
        buttons.anchor(top: decLabel.bottomAnchor, paddingTop: 60, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        purchaseCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 350, bottom: view.bottomAnchor, paddingBottom: 0, left: buttons.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        todayLabel.anchor(top: buttons.bottomAnchor, paddingTop: 105, bottom: nil, paddingBottom: 0, left: buttons.leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        totalLabel.anchor(top: buttons.bottomAnchor, paddingTop: 105, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: buttons.rightAnchor, paddingRight: 0, width: 0, height: 0)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return purchases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "purchaseCell",
            for: indexPath) as? PurchasesCell else { return UICollectionViewCell() }
        let data = purchases[indexPath.item]
        cell.configure(data: data)
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = CGFloat(56)//view.bounds.height / 15
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PotViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
