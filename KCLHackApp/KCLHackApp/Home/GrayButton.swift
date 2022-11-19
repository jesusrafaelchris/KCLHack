import UIKit

class GrayButton:UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSize(size: 50)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: String){
        layout(textcolour: .clear, backgroundColour: .white.withAlphaComponent(0.1), size: 50, text: "", image: UIImage(systemName: image)?.withTintColor(.white).withRenderingMode(.alwaysOriginal), cornerRadius: 25)
    }
    
}
