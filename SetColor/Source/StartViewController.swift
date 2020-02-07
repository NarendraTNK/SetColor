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
    
    //MARK:- Let/Var
    var sideMenuView = SideMenu()
    
    //MARK:- View Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        updateLanguage()
    }
    
    //MARK:- IBAction
    @IBAction public func OnClickSegmentControl(_ sender: UISegmentedControl) {
         
         if (sender.selectedSegmentIndex == 0){
             LanguageManager.shared.currentLanguage = .en
         }else if (sender.selectedSegmentIndex == 1){
            LanguageManager.shared.currentLanguage = .zhHans
         }else if (sender.selectedSegmentIndex == 2){
            LanguageManager.shared.currentLanguage = .lao
         }else if (sender.selectedSegmentIndex == 3){
            LanguageManager.shared.currentLanguage = .th
         }
     }
    
    func updateLanguage()  {
        firstNameLabel.text = Identifier.firstname.localiz()
        lastNameLabel.text = Identifier.lastname.localiz()
        addressLabel.text = Identifier.address.localiz()
        gobtnOutlet.setTitle(Identifier.go.localiz(), for: .normal)
    }
    
    @IBAction public func OnClickGoButton(_ sender: UIButton) {
        
        
    }
    
    @IBAction func OpenSideMenu(_ sender: Any) {
        
        sideMenuView = Bundle.main.loadNibNamed("SideMenu", owner: self, options: nil)?[0] as! SideMenu
        sideMenuView.delegate = self as? menuOpen
        sideMenuView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        sideMenuView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(sideMenuView)
        sideMenuView.layer.zPosition = 1
        sideMenuView.popIn()
        
    }
}



