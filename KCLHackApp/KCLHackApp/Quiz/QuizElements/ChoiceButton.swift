import UIKit

class ChoiceButton: UIButton {
    
//    override open var isSelected: Bool {
//        didSet {
//            backgroundColor = isSelected ? .green : .blue
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isSelected = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addText(text: String, fontSize: CGFloat, cornerRadius: CGFloat) {
        layout(textcolour: .white, backgroundColour: .white.withAlphaComponent(0.1), size: fontSize, text: text, image: nil, cornerRadius: cornerRadius)
    }
}
