//
//  ViewController.swift
//  tip_calculator
//
//  Created by Giorgio Atanasov on 12/22/18.
//  Copyright © 2018 Giorgio Atanasov. All rights reserved.
//

import UIKit
class ViewController: UIViewController {


    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func CalculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "Button")
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        defaults.synchronize()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Button")
        CalculateTip(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Button")
        CalculateTip(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Button")
        CalculateTip(self)
    }

 
    @IBAction func changeSwitch(_ sender: UISwitch) {
        let defaults = UserDefaults.standard
        let isDarkMode = defaults.bool(forKey: "isDarkMode")
        if isDarkMode == true {
            UserDefaults.standard.set(false, forKey: "isDarkMode")  // Set the state
        }
        else {
            UserDefaults.standard.set(true, forKey: "isDarkMode")  // Set the state
        }
    }

    
    
}

