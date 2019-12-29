//
//  resultViewController.swift
//  Tipsy
//
//  Created by Waleed Afifi on 30/12/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var numberOfPeople: UILabel!
    
    var result: String = "0.0"
    var split: Int = 0
    var tip: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        localization()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reculculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension resultViewController {
    func setupView() {
        resultText.text = result
        numberOfPeople.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        
    }
}
