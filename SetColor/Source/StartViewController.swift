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
        
        
    }
    
    //MARK:- IBAction
    @IBAction public func OnClickSegmentControl(_ sender: UISegmentedControl) {
         
         if (sender.selectedSegmentIndex == 0){
             
             Bundle.setLanguage(lang: "en")
             firstNameLabel.text = Identifier.firstname.localized()
             lastNameLabel.text = Identifier.lastname.localized()
             addressLabel.text = Identifier.address.localized()
             gobtnOutlet.setTitle(Identifier.go.localized(), for: .normal)
             
         }else if (sender.selectedSegmentIndex == 1){
             
             Bundle.setLanguage(lang: "zh-Hans")
             firstNameLabel.text = Identifier.firstname.localized()
             lastNameLabel.text = Identifier.lastname.localized()
             addressLabel.text = Identifier.address.localized()
             gobtnOutlet.setTitle(Identifier.go.localized(), for: .normal)
             
         }else if (sender.selectedSegmentIndex == 2){
             
             Bundle.setLanguage(lang: "lo-LA")
             firstNameLabel.text = Identifier.firstname.localized()
             lastNameLabel.text = Identifier.lastname.localized()
             addressLabel.text = Identifier.address.localized()
             gobtnOutlet.setTitle(Identifier.go.localized(), for: .normal)
             
         }else if (sender.selectedSegmentIndex == 3){
             
             Bundle.setLanguage(lang: "th")
             firstNameLabel.text = Identifier.firstname.localized()
             lastNameLabel.text = Identifier.lastname.localized()
             addressLabel.text = Identifier.address.localized()
             gobtnOutlet.setTitle(Identifier.go.localized(), for: .normal)
             
         }
    
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
extension Bundle {
    private static var bundle: Bundle!

    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "en"
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            bundle = Bundle(path: path!)
        }

        return bundle;
    }

    public static func setLanguage(lang: String) {
        UserDefaults.standard.set(lang, forKey: "app_lang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        bundle = Bundle(path: path!)
    }
}
extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.localizedBundle(), value: "", comment: "")
    }

    func localizeWithFormat(arguments: CVarArg...) -> String{
        return String(format: self.localized(), arguments: arguments)
    }
}


