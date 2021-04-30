//
//  PlayerViewController.swift
//  lifecounter
//
//  Created by Fishzz on 4/29/21.
//

import UIKit

class PlayerView: UIView {

    var data : (String, Int) = ("", -1) {
        didSet {
            // Update the label with modified data
            label.text = "\(data.0) : \(data.1)"
        }
    }
    
    var parentView : ViewController?
    
    weak var addOne: UIButton!
    weak var subtractOne: UIButton!
    weak var label: UILabel!
    weak var addBtmInput : UIButton!
    weak var subtractBtmInput: UIButton!
    weak var addInput: UITextField!
    weak var subtractInput: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubViews()
    }
    
    private func initSubViews() {
        // Instantiate the nib into existence
        let nib = UINib(nibName: "PlayerPanelView", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        
        // Get the view from the instantiated nib and add it into our own tree
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
        
        // Wire up the controls to this view
        label = (nibView.subviews[0].subviews[0] as! UILabel)
        label.text = "\(data.0) : \(data.1)"
        
        addOne = (nibView.subviews[0].subviews[1].subviews[0] as! UIButton)
        addOne.addTarget(self, action: #selector(addOne(_:)), for: .touchUpInside)
        subtractOne = (nibView.subviews[0].subviews[1].subviews[1] as! UIButton)
        subtractOne.addTarget(self, action: #selector(subtractOne(_:)), for: .touchUpInside)
        addBtmInput = (nibView.subviews[0].subviews[1].subviews[2] as! UIButton)
        addBtmInput.addTarget(self, action: #selector(addUserInput(_:)), for: .touchUpInside)
        addInput = (nibView.subviews[0].subviews[1].subviews[3] as! UITextField)
        subtractBtmInput = (nibView.subviews[0].subviews[1].subviews[4] as! UIButton)
        subtractBtmInput.addTarget(self, action: #selector(subtractUserInput(_:)), for: .touchUpInside)
        subtractInput = (nibView.subviews[0].subviews[1].subviews[5] as! UITextField)
    }
    
    @objc private func addOne(_ sender : UIButton) {
        // Modify our internal data
        parentView?.addPlayerBtm.isEnabled = false
        data = (data.0, data.1 + 1)
        // Update the label with modified data
        label.text = "\(data.0) : \(data.1)"
        ViewController.history.append("Player \(data.0) added 1 life.")
    }

    @objc private func subtractOne(_ sender : UIButton) {
        parentView?.addPlayerBtm.isEnabled = false
        data = (data.0, data.1 - 1)
        label.text = "\(data.0) : \(data.1)"
        ViewController.history.append("Player \(data.0) lost 1 life.")
        checkLose()
    }

    @objc private func subtractUserInput(_ sender : UIButton) {
        parentView?.addPlayerBtm.isEnabled = false
        NSLog(subtractInput.text ?? "unkown")
        let value = Int(subtractInput.text!)!
        data = (data.0, data.1 - value)
        label.text = "\(data.0) : \(data.1)"
        ViewController.history.append("Player \(data.0) lost \(value) life.")
        checkLose()
    }

    @objc private func addUserInput(_ sender : UIButton) {
        parentView?.addPlayerBtm.isEnabled = false
        NSLog(addInput.text ?? "unkown")
        let value = Int(addInput.text!)!
        data = (data.0, data.1 + value)
        label.text = "\(data.0) : \(data.1)"
        ViewController.history.append("Player \(data.0) added \(value) life.")
    }
    
    func checkLose() {
        if (data.1 <= 0) {
            ViewController.history.append("Player \(data.0) LOSES!")
        }
    }
}
