//
//  GameViewController.swift
//  Roshambo
//
//  Created by José Naves on 28/09/18.
//  Copyright © 2018 José Naves. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func playGameNavigateByCode() {
        print("playGameNavigateByCode")
        let computerMove = generateComputerPlay()
        let result = determineWinner(computerMove: computerMove, userMove: GameMove.rock)
        print(result)

        // All code: Instantiate the results view controller using the storyboard, and set the text of its label property. Connect the action on the rock button.
        
        // get the controller
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        // set the results in ResultViewController
        controller.resultText = result
        controller.computerMove = computerMove
        controller.userMove = GameMove.rock
        
        // present the view controller
        present(controller, animated: true, completion: nil)
    }
    
    // this will be called just before performSegue is called
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        if segue.identifier == "showGameResultSegue" {
            let controller = segue.destination as! ResultViewController
            
            let computerMove = generateComputerPlay()

            let result = determineWinner(computerMove: computerMove, userMove: GameMove.paper)
            print(result)

            // set the results in ResultViewController
            controller.resultText = result
            controller.computerMove = computerMove
            controller.userMove = GameMove.paper
        }
    }
    
    @IBAction func playGamePerformSegueByIdentifier() {
        print("playGamePerformSegueByIdentifier")
        performSegue(withIdentifier: "showGameResultSegue", sender: self)
    }
    
    @IBAction func playGameAutomaticTriggeredSegue() {
        print("playGameAutomaticTriggeredSegue")
        let computerMove = generateComputerPlay()
        determineWinner(computerMove: computerMove, userMove: GameMove.scissor)
    }
    
    func generateComputerPlay() -> GameMove {
        let number = Int.random(in: 0 ... 2)
        return GameMove(rawValue: number)!
    }
    
    func determineWinner(computerMove: GameMove, userMove: GameMove) -> String {
        print("computer: \(computerMove) user: \(userMove)")

        if computerMove == GameMove.rock {
            if userMove == GameMove.rock {
                return Constants.tieResult
            } else if userMove == GameMove.paper {
                return Constants.userWonResult
            } else {
                // user move == scissor
                return Constants.computerWonResult
            }
        } else if computerMove == GameMove.paper {
            if userMove == GameMove.rock {
                return Constants.computerWonResult
            } else if userMove == GameMove.paper {
                return Constants.tieResult
            } else {
                // user move == scissor
                return Constants.userWonResult
            }
        } else {  // computer move is scissor
            if userMove == GameMove.rock {
                return Constants.userWonResult;
            } else if userMove == GameMove.paper {
                return Constants.computerWonResult
            } else {
                // user move == scissor
                return Constants.tieResult
            }
        }
    }
}

