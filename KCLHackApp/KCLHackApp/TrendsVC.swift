import UIKit

class TrendsVC: UIViewController {
    
    lazy var chartImage: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "Chart.png")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
    }
    
    func setupView() {
        view.addSubview(chartImage)
        
        chartImage.anchor(top: view?.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view?.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 0)
    }
    
    

}
