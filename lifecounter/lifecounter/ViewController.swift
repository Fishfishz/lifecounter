//
//  ViewController.swift
//  lifecounter
//
//  Created by Fishzz on 4/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var addPlayerBtm: UIButton!
    
    private var playerNum = 1;
    private var initalHP = 20;
    public static var history : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...4 {
            let playerPanel = PlayerView()
            
            playerPanel.data = ("Player\(playerNum)", initalHP)
            playerPanel.parentView = self
            playerNum += 1;
            contentView.addArrangedSubview(playerPanel)
        }
    }
    
    @IBAction func addPlayer(_ sender: Any) {
        NSLog("ADD PLAYER");
        if (playerNum <= 8) {
            let playerPanel = PlayerView()
                
            playerPanel.data = ("Player\(playerNum)", initalHP)
            playerNum += 1;
            contentView.addArrangedSubview(playerPanel)
        }
    }
    
    @IBAction func viewHistory(_ sender: Any) {

    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: (Any)?) {
        if let his = segue.destination as? HistoryViewController {
            var toHistoryView = ""
            for activity in ViewController.history {
                toHistoryView.append(activity + "\n")
            }
            his.updateContent = toHistoryView
        }
    }
    
}
