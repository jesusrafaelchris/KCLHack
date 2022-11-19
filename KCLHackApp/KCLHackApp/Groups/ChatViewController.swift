import UIKit

class ChatViewController: UIViewController {
    
    var groups = [group]()
    
    lazy var friendsTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 26, text: "Groups", bold: true)
        return text
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setsizedImage(symbol: "plus", size: 12, colour: .white)
        addButton.backgroundColor = .darkGray
        addButton.layer.cornerRadius = 17
        addButton.layer.masksToBounds = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    lazy var groupCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(GroupsCell.self, forCellWithReuseIdentifier: "groupCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        groups = [
            group(image: "BlackRock", name: "BlackRock Hackathon", memberCount: "Members: 3"),
            group(image: "KCL", name: "EE King's '23", memberCount: "Members: 8"),
            group(image: "KCLTech", name: "KCL Tech Society", memberCount: "Members: 15"),
            group(image: "HackKings", name: "HackKing's Group", memberCount: "Members: 4"),
            group(image: "Football", name: "Football Club", memberCount: "Members: 25"),
            group(image: "Taekwando", name: "Taekwando Society", memberCount: "Members: 5")
        ]
        
    }
    
    func setUpView(){
        view.addSubview(friendsTitle)
        view.addSubview(addButton)
        view.addSubview(groupCollectionView)
        
        friendsTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 20, right: nil, paddingRight: 0, width: 0, height: 0)
        
        addButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 20, width: 34, height: 34)
        
        groupCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 70, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
    }
    
}

extension ChatViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "groupCell",
            for: indexPath) as? GroupsCell else { return UICollectionViewCell() }
        let data = groups[indexPath.item]
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
