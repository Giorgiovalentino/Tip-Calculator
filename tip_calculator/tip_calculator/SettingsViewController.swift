//
//  SettingsViewController.swift
//  tip_calculator
//
//  Created by Giorgio Atanasov on 12/23/18.
//  Copyright © 2018 Giorgio Atanasov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var DefaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DefaultChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(DefaultTipControl.selectedSegmentIndex, forKey: "Button")
        defaults.synchronize()
        
        let dataValue = defaults.integer(forKey: "Button")

        defaults.synchronize()
        DefaultTipControl.selectedSegmentIndex = dataValue
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DefaultTipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Button")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DefaultTipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Button")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DefaultTipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Button")
    }
    
}
