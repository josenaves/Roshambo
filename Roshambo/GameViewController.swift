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
    }
    
    @IBAction func playGamePerformSegueByIdentifier() {
        print("playGamePerformSegueByIdentifier")
    }
    
    @IBAction func playGameAutomaticTriggeredSegue() {
        print("playGameAutomaticTriggeredSegue")
    }
}

