//
//  ViewController.swift
//  TrafficLights
//
//  Created by Ерик Мусапиров on 21.08.2021.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!

    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let LightIsOn: CGFloat = 1
    private let LightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = LightIsOff
        yellowLight.alpha = LightIsOff
        greenLight.alpha = LightIsOff
         
        print("Размер стороны, доступный в методе viewDidLoad \(redLight.frame.height)")
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius =
            redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
       greenLight.layer.cornerRadius = redLight.frame.width / 2
        
        print("Размер стороны, доступный в методе viewWillLayoutSubviews \(redLight.frame.height)")
    }
    
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLight.alpha = LightIsOff
            redLight.alpha = LightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = LightIsOff
            yellowLight.alpha = LightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = LightIsOn
            yellowLight.alpha = LightIsOff
            currentLight = .red
            
        }
    }

}
