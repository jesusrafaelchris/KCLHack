import UIKit

class ProgressView: UIView {
    
    var views = [ProgressBar]()

    let progress1 = ProgressBar()
    let progress2 = ProgressBar()
    let progress3 = ProgressBar()
    let progress4 = ProgressBar()
    let progress5 = ProgressBar()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.addArrangedSubview(progress1)
        stackView.addArrangedSubview(progress2)
        stackView.addArrangedSubview(progress3)
        stackView.addArrangedSubview(progress4)
        stackView.addArrangedSubview(progress5)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        views = [progress1, progress2, progress3, progress4, progress5]
        progress1.select()
        addSubview(buttonStackView)
        buttonStackView.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        progress1.makeHeight(size: 1)
        progress2.makeHeight(size: 1)
        progress3.makeHeight(size: 1)
        progress4.makeHeight(size: 1)
        progress5.makeHeight(size: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetAll() {
        progress1.reset()
        progress2.reset()
        progress3.reset()
        progress4.reset()
        progress5.reset()
    }
}
