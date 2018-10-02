//
//  ResultViewController.swift
//  Roshambo
//
//  Created by José Naves on 28/09/18.
//  Copyright © 2018 José Naves. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultText: String?
    var computerMove: GameMove?
    var userMove: GameMove?
    
    @IBOutlet var imageResult: UIImageView!
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var buttonPlayAgain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelResult.text = resultText
        
        switch userMove! {
        case GameMove.paper:
            if (computerMove == GameMove.paper) {
                imageResult.image = UIImage(named: Constants.imageNameTie)
            } else if (computerMove == GameMove.rock) {
                imageResult.image = UIImage(named: Constants.imageNamePaperCoversRock)
            } else {
                imageResult.image = UIImage(named: Constants.imageNameScissorsCutPaper)
            }
            
        case GameMove.rock:
            if (computerMove == GameMove.paper) {
                imageResult.image = UIImage(named: Constants.imageNamePaperCoversRock)
            } else if (computerMove == GameMove.rock) {
                imageResult.image = UIImage(named: Constants.imageNameTie)
            } else {
                imageResult.image = UIImage(named: Constants.imageNameRockCrushesScissors)
            }
            
        case GameMove.scissor:
            if (computerMove == GameMove.paper) {
                imageResult.image = UIImage(named: Constants.imageNameScissorsCutPaper)
            } else if (computerMove == GameMove.rock) {
                imageResult.image = UIImage(named: Constants.imageNameRockCrushesScissors)
            } else {
                imageResult.image = UIImage(named: Constants.imageNameTie)
            }
        }
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }
}
