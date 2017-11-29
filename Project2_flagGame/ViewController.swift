//
//  ViewController.swift
//  Project2_flagGame
//
//  Created by 김은진 on 06/11/2017.
//  Copyright © 2017 BlissBless. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries: [String] = [] // make a property
    var score: Int = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() { // use array to shorten code
        super.viewDidLoad()
        
        let buttons: [UIButton] = [button1, button2, button3]
        for button in buttons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

