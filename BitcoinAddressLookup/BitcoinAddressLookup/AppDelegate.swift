//
//  AppDelegate.swift
//  BitcoinAddressLookup
//
//  Created by Haakon W Hoel Bakker on 17/12/2017.
//  Copyright © 2017 Bakker Technologies. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBAction func aboutBT(_ sender: Any) {
        print("Want to know about BT")
        if let url = URL(string: "https://www.bakkertechnologies.com"), NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
        }
    }
    
    @IBAction func moreTools(_ sender: Any) {
        if let url = URL(string: "https://www.github.com/haakonbakker"), NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

