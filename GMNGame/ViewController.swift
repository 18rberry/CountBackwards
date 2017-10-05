//
//  ViewController.swift
//  GMNGame
//
//  Created by Riya Berry on 9/20/17.
//  Copyright © 2017 Riya Berry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var game = CBGame()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var intervalLabel: UILabel!
    
    @IBAction func testGuess(_ sender: Any) {
        if let textEntry = textField.text {
            if let guess = Int(textEntry) {
                resultLabel.text = game.finishGame(number: Int(label1.text!)!, interval: Int(intervalLabel.text!)!, input: guess)
            }
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        resetAll()
    }
    
    func resetAll() {
        resultLabel.text = ""
        textField.text = ""
        textField.delegate = self
        label1.text = "\(game.chooseNumber())"
        intervalLabel.text = "\(game.chooseInterval())"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        label1.text = "\(game.chooseNumber())"
        intervalLabel.text = "\(game.chooseInterval())"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


