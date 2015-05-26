//
//  AppDelegate.swift
//  SpeakLine
//
//  Created by Frank McAuley on 5/26/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

   var mainWindowController: MainWindowController?
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        mainWindowController = MainWindowController()
        mainWindowController!.showWindow(self)
        
    }


}

