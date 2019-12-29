//
//  ViewController.swift
//  Tipsy
//
//  Created by 2019 Waleed Afifi on 09/09/2019.
//  Copyright © 2019 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var counterText: UILabel!
    @IBOutlet weak var segmentButton: UIStepper!
    
    var tip: Double = 0.1
    var numberOfPeople: Int = 1
    var billTotal: Double? = 0.0
    var finalResult: String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
    @IBAction func tipPressed(_ sender: UIButton) {
        numberText.endEditing(true)
        
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? ""
        let buttonMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonMinusPercentSign) ?? 0.0
        
        tip = buttonTitleAsNumber / 100
    }
    
    @IBAction func calculatorPressed(_ sender: Any) {
        if let bill = numberText.text {
            billTotal = Double(bill)
            let result = (billTotal ?? 0.0) * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        counterText.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! resultViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}

extension ViewController {
    func setupView() {
        tenButton.isSelected = true
    }
    
    func localization() { }
    
    func setupData() { }
    
    func fetchData() { }
}
