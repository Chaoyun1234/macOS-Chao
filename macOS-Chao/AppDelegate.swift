//
//  AppDelegate.swift
//  macOS-Chao
//
//  Created by bys on 24/11/2017.
//  Copyright © 2017 bys. All rights reserved.
//

import Cocoa
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterPush

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, MSPushDelegate, MSCrashesDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        MSPush.setDelegate(self)
        MSCrashes.setDelegate(self)
        MSAppCenter.setLogUrl("https://in-staging-south-centralus.staging.avalanch.es")
        MSAppCenter.start("01a561d0-3bd5-4ce0-b10e-b5be17d06672", withServices:[
            MSAnalytics.self,
            MSCrashes.self,
            MSPush.self
            ])
        MSAnalytics.trackEvent("Label")
        MSAnalytics.trackEvent("Say Hello Button")
        MSAppCenter.setLogLevel(MSLogLevel.verbose)
        var install = MSAppCenter.installId()
        
    }
   
    func push(_ push: MSPush!, didReceive pushNotification: MSPushNotification!) {
        let title: String = pushNotification.title ?? ""
        var message: String = pushNotification.message ?? ""
        var customData: String = ""
        for item in pushNotification.customData {
            customData =  ((customData.isEmpty) ? "" : "\(customData), ") + "\(item.key): \(item.value)"
        }
        message =  message + ((customData.isEmpty) ? "" : "\n\(customData)")
        let alert: NSAlert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

