//
//  ViewController.swift
//  lifecounter
//
//  Created by Fishzz on 4/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var player1Output: UILabel!
    
    @IBOutlet weak var player3Output: UILabel!
    @IBOutlet weak var player4Output: UILabel!
    @IBOutlet weak var player2Output: UILabel!
    @IBOutlet weak var message: UILabel!
    
    var player1Life : Int = 1
    var player2Life : Int = 1
    var player3Life : Int = 1
    var player4Life : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player1Life = 1
        player2Life = 1
        player3Life = 1
        player4Life = 1
        message.text = ""
        setUpButton(view: self.view)
    }

    func setUpButton(view: UIView) {
        for subview in view.subviews {
            if subview.subviews.count > 0 {
                self.setUpButton(view: subview)
            } else if subview is AddOneButton {
                let button = subview as! AddOneButton
                button.addTarget(self, action: #selector(ViewController.addOneButtonPressed(sender:)), for: .touchUpInside)
            } else if subview is MinusOneButton {
                let button = subview as! MinusOneButton
                button.addTarget(self, action: #selector(ViewController.minusOneButtonPressed(sender:)), for: .touchUpInside)
            } else if subview is AddFiveButton {
                let button = subview as! AddFiveButton
                button.addTarget(self, action: #selector(ViewController.addFiveButtonPressed(sender:)), for: .touchUpInside)
            } else if subview is MinusFiveButton {
                let button = subview as! MinusFiveButton
                button.addTarget(self, action: #selector(ViewController.minusFiveButtonPressed(sender:)), for: .touchUpInside)
            }
        }
    }
    
    func buttonLogic(playerId: Int, pointsChange: Int) {
        switch playerId {
        case 1:
            player1Life += pointsChange
            NSLog(String(player1Life))
            if player1Life <= 0 {
                message.text = "Player 1 LOSES!"
            }
            player1Output.text = String(player1Life)
        case 2:
            player2Life += pointsChange
            NSLog(String(player2Life))
            if player2Life <= 0 {
                message.text = "Player 2 LOSES!"
            }
            player2Output.text = String(player2Life)
        case 3:
            player3Life += pointsChange
            NSLog(String(player3Life))
            if player3Life <= 0 {
                message.text = "Player 3 LOSES!"
            }
            player3Output.text = String(player3Life)
        case 4:
            player4Life += pointsChange
            NSLog(String(player4Life))
            if player4Life <= 0 {
                message.text = "Player 4 LOSES!"
            }
            player4Output.text = String(player4Life)
        default:
            NSLog("can not find your player")
        }
    }
    
    
    @objc func addOneButtonPressed(sender: AddOneButton) {
        let playerId = sender.superview?.tag ?? 0
        buttonLogic(playerId: playerId, pointsChange: 1)
    }
    
    @objc func minusOneButtonPressed(sender: MinusOneButton) {
        let playerId = sender.superview?.tag ?? 0
        buttonLogic(playerId: playerId, pointsChange: -1)
    }
    
    @objc func addFiveButtonPressed(sender: AddFiveButton) {
        let playerId = sender.superview?.tag ?? 0
        buttonLogic(playerId: playerId, pointsChange: 5)
    }
    
    @objc func minusFiveButtonPressed(sender: MinusFiveButton) {
        let playerId = sender.superview?.tag ?? 0
        buttonLogic(playerId: playerId, pointsChange: -5)
    }
}

@IBDesignable class AddOneButton: UIButton {
}

@IBDesignable class MinusOneButton: UIButton {
}

@IBDesignable class AddFiveButton: UIButton {
}

@IBDesignable class MinusFiveButton: UIButton {
}
