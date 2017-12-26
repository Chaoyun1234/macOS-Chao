//
//  ViewController.swift
//  macOS-Chao
//
//  Created by bys on 24/11/2017.
//  Copyright © 2017 bys. All rights reserved.
//

import Cocoa
import AppCenterCrashes
import AppCenterAnalytics
class ViewController: NSViewController {
    
    @IBOutlet weak var nameField: NSTextField!
    
    @IBOutlet weak var helloLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func sayButtonClicked(_ sender: Any) {
        var name = nameField.stringValue
        if name.isEmpty{
            name = "Word"
            MSCrashes.generateTestCrash()
            
        }
        let greeting = "Hello \(name)!"
        helloLabel.stringValue = greeting
        MSAnalytics.trackEvent("sayButtonClicked")
    }
}
