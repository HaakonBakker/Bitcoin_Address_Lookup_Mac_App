//
//  ViewController.swift
//  BitcoinAddressLookup
//
//  Created by Haakon W Hoel Bakker on 17/12/2017.
//  Copyright © 2017 Bakker Technologies. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var addressTextField: NSTextField!
    @IBOutlet weak var totalReceivedLabel: NSTextField!
    @IBOutlet weak var totalSentLabel: NSTextField!
    @IBOutlet weak var finalBalanceLabel: NSTextField! 
    @IBOutlet weak var ntxLabel: NSTextField!
    
    let lookup = Lookup()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func performLookup(_ sender: Any) {
        
        self.performTheActualLookup()
        
    }
    
    
    func performTheActualLookup(){
        print(addressTextField.stringValue)
        lookup.performRequest(address:addressTextField.stringValue, completion: { (success) -> Void in
            //print(success)
            
            // Redraw Labels
            DispatchQueue.main.async{
                if (success["error"] != nil){
                    print("DET ER EN FEIL")
                }else{
                    self.totalReceivedLabel.stringValue = String(self.lookup.satoshiToBTC(sat:success["total_received"] as! Int))
                    self.totalSentLabel.stringValue = String(self.lookup.satoshiToBTC(sat:success["total_sent"] as! Int))
                    self.finalBalanceLabel.stringValue = String(self.lookup.satoshiToBTC(sat:success["final_balance"] as! Int))
                    self.ntxLabel.stringValue = String(format: "%@", success["n_tx"] as! CVarArg)
                }
                
                
            }
            
        })
    }
    
    @IBAction func textFieldAction(_ sender: Any) {
        self.performTheActualLookup()
    }
    
}

