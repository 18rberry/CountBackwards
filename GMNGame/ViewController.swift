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
    var wrong: Int = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBAction func resetScore(_ sender: Any) {
        game.count = 0
        scoreLabel.text = "Score: \(game.count)"
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        let originalNo = Int(label1.text!)!
        let intervalNo = Int(intervalLabel.text!)!
        answerLabel.isHidden = false
        answerLabel.text! = "Answer: " + String(originalNo - intervalNo)
        print(answerLabel.text)
    }
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func testGuess(_ sender: Any) {
        if let textEntry = textField.text {
            if let guess = Int(textEntry) {
                resultLabel.text = game.finishGame(number: Int(label1.text!)!, interval: Int(intervalLabel.text!)!, input: guess)
                if resultLabel.text == "You win! Now continue playing!"{
                    wrong = 0
                    label1.text = "\(guess)"
                    textField.text = ""
                } else {
                    wrong += 1
                    if wrong == 3 {
                        showAnswerButton.isHidden = false
                    }
                    //checkWrong(label1: label1.text!, interval: intervalLabel.text!)
                }
                scoreLabel.text = "Score: \(game.count)"
            }
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        resetAll()
    }
    
    func checkWrong(label1: String, interval: String) {
        if wrong == 3 {
            showAnswerButton.isHidden = false
            let originalNo = Int(label1)!
            let intervalNo = Int(interval)!
            textField.text = String(originalNo - intervalNo)
        }
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
        showAnswerButton.isHidden = true
        answerLabel.isHidden = true
        textField.delegate = self
        label1.text = "\(game.chooseNumber())"
        intervalLabel.text = "\(game.chooseInterval())"
        textField.returnKeyType = .done
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("return pressed")
        textField.resignFirstResponder()  //if desired
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


