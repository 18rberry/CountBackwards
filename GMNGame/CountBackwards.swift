//
//  CountBackwards.swift
//  GMNGame
//
//  Created by Riya Berry on 9/22/17.
//  Copyright © 2017 Riya Berry. All rights reserved.
//

import Foundation

class CBGame{
    
    func name() -> String {
        return "Count Backwards"
    }
    //computer chooses a start number
    func chooseNumber() -> Int {
        let number = Int(arc4random_uniform(200) + 100)
        return number
    }
    
    //computer chooses the interval that the user should count backwards by
    func chooseInterval() -> Int {
        let array = [7,8,9,11,12,13,14]
        let index = Int(arc4random_uniform(7))
        let chosen = array[index]
        return chosen
    }
    
    //see if the user wants to play again
    func playAgain() -> String {
        print("Do you want to play again? (y/n)")
        let answer = readLine()
        if let answer = answer {
            if (answer.lowercased() != "y"){
                return "n"
            } else {
                return "y"
            }
        }
        return "y"
    }
    
    // runs the major of the game
    func finishGame(number: Int, interval: Int, input: Int) -> String {
        let newNumber = number - interval
        while (input != newNumber){
            if input > newNumber{
                return "Too high! Try again."
            } else if input < newNumber {
                return "Too low! Try again."
            }
        }
        return "You win!"
    }
}
