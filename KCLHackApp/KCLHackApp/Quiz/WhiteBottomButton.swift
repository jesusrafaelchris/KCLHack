import UIKit

class WhiteBottomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout(textcolour: .black, backgroundColour: .white, size: 16, text: "Continue", image: nil, cornerRadius: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
