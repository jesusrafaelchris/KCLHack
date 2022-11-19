import UIKit

class ProgressBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white.withAlphaComponent(0.4)
    }
    
    func select() {
        backgroundColor = .white
    }
    
    func reset() {
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
