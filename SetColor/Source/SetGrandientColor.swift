//
//  SetGrandientColor.swift
//  SetColor
//
//  Created by hfcb on 2/5/20.
//  Copyright © 2020 hfcb. All rights reserved.
//

import UIKit

public class SetGrandientColor: NSObject {

    static public let shared = SetGrandientColor()
    
    public let isColorSet = false
    
    public override init() {
        
    }
    
    public func setColorToView(view : UIView)  {
        
        view.backgroundColor = .blue
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
    }
    
    deinit {
        
    }
}
