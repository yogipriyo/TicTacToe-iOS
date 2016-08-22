//
//  ViewController.swift
//  Noughts And Crossess
//
//  Created by yogi prayogo on 8/22/16.
//  Copyright © 2016 yogipriyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var activePlayer = 1 //1 equal noughts & 2 equal crossess
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            
            gameState[sender.tag] =  activePlayer
            
            if activePlayer == 1{
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        //print("Noughts have won!")
                        gameOverLabel.text = "Noughts have won!"
                        
                    } else {
                        
                        //print("Crosses have won!")
                        gameOverLabel.text = "Crosses have won!"
                        
                    }
                    
                    endGame()
                    
                }
                
            }
            
            if gameActive == true {
            
                gameActive = false
            
                for buttonState in gameState {
                
                    if buttonState == 0 {
                    
                        gameActive = true
                    
                    }
                
                }
            
                if gameActive == false {
                
                    gameOverLabel.text = "It's a draw!"
                    endGame()
                
                }
                
            }
            
        }
        
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        var buttonToClear : UIButton
        
        for i in 0 ..< 9 {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    func endGame() {
        
        playAgainButton.hidden = false
        gameOverLabel.hidden = false
        UIView.animateWithDuration(0.5, animations: {
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
        })
        
    }
    
}

