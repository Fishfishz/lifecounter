//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Fishzz on 4/29/21.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var historyContent: UILabel!
    
    public var updateContent: String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if updateContent != nil {
            self.historyContent.text = updateContent
        }
    }


}
