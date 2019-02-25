//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    // Index: 1
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    //Index: 2
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    //Index: 3
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    //Index: 4, show results
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    var storyIndex: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        resetStory()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        let topBottomIsClicked = sender.tag == 1
        
        if(storyIndex == 1) {
            if topBottomIsClicked {
                storyIndex = 3
                updateUI(story3, answer3a, answer3b)
            } else {
                storyIndex = 2
                updateUI(story2, answer2a, answer2b)
            }
        } else if(storyIndex == 2) {
            if topBottomIsClicked {
                storyIndex = 3
                updateUI(story3, answer3a, answer3b)
            } else {
                storyIndex = 4
                updateUI(story4, "Reset Story", "")
            }
        } else if(storyIndex == 3) {
            if topBottomIsClicked {
                storyIndex = 6
                updateUI(story6, "Reset Story", "")
            } else {
                storyIndex = 5
                updateUI(story5, "Reset Story", "")
            }
        } else {
            if topBottomIsClicked {
                resetStory()
            }
        }
    }
    
    func resetStory() {
        storyIndex = 1
        updateUI(story1, answer1a, answer1b)
    }
    
    func updateUI(_ story: String,_ topButtonText: String,_ bottomButtonText: String) {
        storyTextView.text = story
        if topButtonText != "" {
            topButton.isHidden = false
            topButton.setTitle(topButtonText, for: .normal)
        } else {
            topButton.isHidden = true
        }
        
        if bottomButtonText != "" {
            bottomButton.isHidden = false
             bottomButton.setTitle(bottomButtonText, for: .normal)
        } else {
             bottomButton.isHidden = true
        }
    }
}

