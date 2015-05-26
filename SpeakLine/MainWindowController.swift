//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by Frank McAuley on 5/26/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    
    let speechSynth = NSSpeechSynthesizer()
    var isStarted: Bool = false {
        didSet{
            updateButtons()
        }
    }
    
    
    override var windowNibName: String {
        return "MainWindowController"
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        updateButtons()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    // MARK: - Private Methods
    func updateButtons(){
        if isStarted{
            speakButton.enabled = false
            stopButton.enabled = true
        } else {
            stopButton.enabled = false
            speakButton.enabled = true
        }
    }
    
    // MARK: - Action Methods
    @IBAction func speakIt(sender: NSButton) {
        // Get typed-in text as a string
        let string = textField.stringValue
        if string.isEmpty{
            println("string from \(textField) is empty")
        } else {
            speechSynth.startSpeakingString(string)
            isStarted = true
        }
    }
    
    @IBAction func stopIt(sender: NSButton){
        speechSynth.stopSpeaking()
        isStarted = false
    }
    
}
