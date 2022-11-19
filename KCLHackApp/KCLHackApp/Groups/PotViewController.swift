import UIKit

class PotViewController: UIViewController {
    
    var friends = [friend]()
    
    var centery: NSLayoutYAxisAnchor?
    
    lazy var member1: UIImageView = {
        let member1 = UIImageView()
        member1.image = UIImage(named: "Member1")
        member1.contentMode = .scaleAspectFill
        member1.layer.masksToBounds = true
        member1.layer.cornerRadius = 20
        return member1
    }()
    
    lazy var member2: UIImageView = {
        let member2 = UIImageView()
        member2.image = UIImage(named: "Member2")
        member2.contentMode = .scaleAspectFill
        member2.layer.masksToBounds = true
        member2.layer.cornerRadius = 20
        return member2
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setsizedImage(symbol: "plus", size: 14, colour: .white)
        addButton.backgroundColor = .darkGray
        addButton.layer.cornerRadius = 17
        addButton.layer.masksToBounds = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    lazy var groupTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 22, text: "BlackRock Friends", bold: true)
        return text
    }()
    
    lazy var bellButton: UIButton = {
        let addButton = UIButton()
        addButton.setsizedImage(symbol: "bell.badge.fill", size: 16, colour: .white)
        return addButton
    }()
    
    lazy var potLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 20, text: "Current pot value", bold: true)
        return text
    }()
    
    lazy var boxView: PotView = {
        let view = PotView()
        return view
    }()
    
    lazy var friendsTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 20, text: "This weeks ranking", bold: true)
        return text
    }()
    
    lazy var friendCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(FriendsCell.self, forCellWithReuseIdentifier: "friendCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        friends = [
            friend(image: "Member1", name: "Artemiy", saverStatus: "Super Saver", num: "65%"),
            friend(image: "Member2", name: "Christian", saverStatus: "Medium Saver", num: "34%"),
            friend(image: "Member3", name: "Adesh", saverStatus: "Mediocre Saver", num: "3%")
        ]
        view.backgroundColor = .black
        
    }
    
    func setUpView(){
        
        view.addSubview(member2)
        view.addSubview(member1)
        view.addSubview(addButton)
        view.addSubview(groupTitle)
        view.addSubview(bellButton)
        
        view.addSubview(boxView)
        view.addSubview(potLabel)
        view.addSubview(friendsTitle)
        view.addSubview(friendCollectionView)
        
    
        
        centery = member1.centerYAnchor
        
        member1.anchor(top: nil, paddingTop:    0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 20, right: nil, paddingRight: 0, width: 40, height: 40)
        member1.centerYAnchor.constraint(equalTo: centery!).isActive = true
        
        member2.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: member1.leftAnchor, paddingLeft: 32, right: nil, paddingRight: 0, width: 40, height: 40)
        member2.centerYAnchor.constraint(equalTo: centery!).isActive = true
        
        addButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: member2.rightAnchor, paddingLeft: 6, right: nil, paddingRight: 0, width: 34, height: 34)
        addButton.centerYAnchor.constraint(equalTo: centery!).isActive = true
        
        groupTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: addButton.rightAnchor, paddingLeft: 20, right: nil, paddingRight: 0, width: 0, height: 0)
        groupTitle.centerYAnchor.constraint(equalTo: centery!).isActive = true
        
        bellButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 8, width: 0, height: 0)
        bellButton.centerYAnchor.constraint(equalTo: centery!).isActive = true
        
        boxView.anchor(top: member1.bottomAnchor, paddingTop: 55, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 30, right: view.rightAnchor, paddingRight: 30, width: 0, height: 200)
        
        potLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 65, bottom: nil, paddingBottom: 0, left: boxView.leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        
        friendsTitle.anchor(top: boxView.bottomAnchor, paddingTop: -55, bottom: nil, paddingBottom: 0, left: boxView.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 30, width: 0, height: 200)
        
        friendCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 365, bottom: view.bottomAnchor, paddingBottom: 0, left: boxView.leftAnchor, paddingLeft: 0, right: boxView.rightAnchor, paddingRight: 0, width: 0, height: 0)

    }
}

extension PotViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "friendCell",
            for: indexPath) as? FriendsCell else { return UICollectionViewCell() }
        let data = friends[indexPath.item]
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
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PotViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
