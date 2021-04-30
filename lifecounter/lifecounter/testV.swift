//
//  testV.swift
//  lifecounter
//
//  Created by Fishzz on 4/29/21.
//


import UIKit

class TestView: UIView {
    
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
        let nib = UINib(nibName: "testView", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        
        // Get the view from the instantiated nib and add it into our own tree
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
    }


}


