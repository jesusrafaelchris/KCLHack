import UIKit

protocol SliderSelectionDelegate: AnyObject {
    func didSelectSliderValue(question: String, prediction: String, answer: String, slider: UISlider)
}

class SliderView: UIView {
    
    var answer: String = ""
    var question: String = ""
    weak var delegate: SliderSelectionDelegate?
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.addTarget(self, action: #selector(didFinishDragging), for: .touchUpInside)
        slider.minimumValue = 0
        slider.tintColor = .purple
        slider.maximumValue = 100
        return slider
    }()
    
    lazy var valueLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 20, text: "", bold: true)
        text.textAlignment = .center
        text.adjustsFontSizeToFitWidth = true
        text.numberOfLines = 0
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(slider)
        addSubview(valueLabel)
        //backgroundColor = .white.withAlphaComponent(0.1)
        
        slider.anchor(top: topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 12, right: rightAnchor, paddingRight: 12, width: 0, height: 0)
        
        valueLabel.anchor(top: slider.bottomAnchor, paddingTop: 32, bottom: bottomAnchor, paddingBottom: 12, left: leftAnchor, paddingLeft: 12, right: rightAnchor, paddingRight: 12, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didFinishDragging(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        delegate?.didSelectSliderValue(question: question, prediction: "\(currentValue)", answer: answer, slider: slider)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        valueLabel.text = "\(currentValue)"
    }
}
