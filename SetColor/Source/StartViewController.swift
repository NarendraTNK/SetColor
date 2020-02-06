//
//  StartViewController.swift
//  SetColor
//
//  Created by hfcb on 2/5/20.
//  Copyright © 2020 hfcb. All rights reserved.
//

import UIKit

public class StartViewController: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak public var languageSegmentControl: UISegmentedControl!
    @IBOutlet weak public var firstNameLabel: UILabel!
    @IBOutlet weak public var lastNameLabel: UILabel!
    @IBOutlet weak public var addressLabel: UILabel!
    @IBOutlet weak public var gobtnOutlet: UIButton!
    
    
    //MARK:- View Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = Identifier.firstname
        lastNameLabel.text = Identifier.lastname
        addressLabel.text = Identifier.address
        gobtnOutlet.setTitle(Identifier.go, for: .normal)
        
    }
    
    //MARK:- IBAction
    @IBAction public func OnClickSegmentControl(_ sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 0){
            
        }else if (sender.selectedSegmentIndex == 1){
            
        }else if (sender.selectedSegmentIndex == 2){
            
        }else if (sender.selectedSegmentIndex == 3){
            
        }
   
    }
    @IBAction public func OnClickGoButton(_ sender: UIButton) {
        
        
    }

}
