//
//  ViewController.swift
//  GMNGame
//
//  Created by Riya Berry on 9/20/17.
//  Copyright © 2017 Riya Berry. All rights reserved.
// Main View Controller that holds the code for the majority of the app 

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
    //resets the score and essentially restarts the game when the user presses "Reset Score"
    @IBAction func resetScore(_ sender: Any) {
        game.count = 0
        showAnswerButton.isHidden = true
        resultLabel.text = ""
        scoreLabel.text = "Score: \(game.count)"
        textField.text = ""
    }
    
    //button appears when user gets the answer wrong 3 times and allows user to see the answer when the "Show Answer" button is pressed
    @IBAction func showAnswer(_ sender: Any) {
        let originalNo = Int(label1.text!)!
        let intervalNo = Int(intervalLabel.text!)!
        answerLabel.isHidden = false
        answerLabel.text! = "Answer: " + String(originalNo - intervalNo)
        print(answerLabel.text)
    }
    
    @IBOutlet weak var answerLabel: UILabel!
    
    //receives the user input the user types in and judges whether their answer is correct or not and then how to process that information
    @IBAction func testGuess(_ sender: Any) {
        if let textEntry = textField.text {
            if Int(textEntry) != nil {
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
                        wrong = 0
                    } else {
                        showAnswerButton.isHidden = true
                        answerLabel.isHidden = true
                    }
                    //checkWrong(label1: label1.text!, interval: intervalLabel.text!)
                }
                scoreLabel.text = "Score: \(game.count)"
                }
            }
            
            else {
                let alert = UIAlertController(title: "Alert", message: "Please enter a valid number", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
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
    
    //resets everything when the user wants to play again
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


