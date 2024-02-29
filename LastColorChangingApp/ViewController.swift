//
//  ViewController.swift
//  LastColorChangingApp
//
//  Created by Work on 27.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet var valuesStack: UIStackView!
    @IBOutlet var slidersStack: UIStackView!
    
    private var color: (red: CGFloat,
                        green: CGFloat,
                        blue: CGFloat) = (red: 1,
                                          green: 1,
                                          blue: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        updateAllValueLabels()
        
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        changeViewColor(with: sender.tag)
        updateValueLabel(withTag: sender.tag)
    }
    
    private func changeViewColor(with tag: Int) {
        setColor(withTag: tag)
        colorView.backgroundColor = UIColor(red: color.red,
                                            green: color.green,
                                            blue: color.blue,
                                            alpha: 1)
    }
    
    private func setColor(withTag tag: Int) {
        if let slider: UISlider = slidersStack.subviews[tag] as? UISlider {
            let colorValue = CGFloat(slider.value)
            
            switch tag {
            case 0:
                color.red = colorValue
            case 1:
                color.green = colorValue
            case 2:
                color.blue = colorValue
            default:
                break
            }
        }
    }
    
    private func updateValueLabel(withTag tag: Int) {
        var valueLabel = valuesStack.subviews[tag] as? UILabel
        var sliderValue = slidersStack.subviews[tag] as? UISlider
        valueLabel?.text = String(format: "%.2f", sliderValue?.value ?? 0)
    }
    
    
    
    private func updateAllValueLabels() {
        for tag in 0..<slidersStack.subviews.count{
            updateValueLabel(withTag: tag)
        }
    }
    
  
    
    
}

