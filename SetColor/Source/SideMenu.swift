//
//  SideMenu.swift
//  ECGame
//
//  Created by hfcb on 13/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import SwiftyJSON
import SimpleAnimation


class SideMenu: UIView, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var menuTableView: UITableView!
    weak var delegate:menuOpen?
    var menuArray = [JSON]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadInitialViewWithJsonFile()
    }
    func loadInitialViewWithJsonFile() {
        
        //Table view delegate and datasource
        menuTableView.delegate = self
        menuTableView.dataSource = self
        //Register XIB to the tableView
        let bundle = Bundle(for: self.classForCoder)
        let nib = UINib(nibName: "MenuTableViewCell", bundle: bundle)
        self.menuTableView.register(nib, forCellReuseIdentifier: "MenuTableViewCell")
        //Remove extra cells from tableView
        menuTableView.tableFooterView = UIView()
        readJsonFromBunble()
    }
  
    func readJsonFromBunble() {
        let bundle = Bundle(for: self.classForCoder)
        print("bundle---->",bundle)
        if let path = bundle.path(forResource: "SideMenuNew", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let sideMenu = try! JSON(data: data)
                self.menuArray = []
                if let sideMenuArr = sideMenu.array {
                    self.menuArray = sideMenuArr
                    menuTableView.reloadData()
                }
            } catch {
                
            }
        }
    }
    
    @IBAction func closeMenuAction(_ sender: Any) {
        self.popIn()
        self.removeFromSuperview()
    }
    
}

extension SideMenu {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
//        let onepasswordExtensionResourcesBundle = Bundle(path: Bundle(for: OnePasswordExtension.self).path(forResource: "OnePasswordExtensionResources", ofType: "bundle") ?? "")
//        let image = UIImage(named: "onepassword-button.png", in: onepasswordExtensionResourcesBundle, compatibleWith: nil)
        let bundle: Bundle = Bundle(identifier: "org.cocoapods.SetColor")!
        cell.menuImageView.image =  UIImage(named: menuArray[indexPath.row]["imageName"].string!, in: bundle, compatibleWith: nil)
            //cell.menuImageView.image = ImageHelper.image(menuArray[indexPath.row]["imageName"].string!)
            //UIImage(named: menuArray[indexPath.row]["imageName"].string!)
        cell.menuLabel.text = menuArray[indexPath.row]["menuname"].string?.localiz()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
     
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.popIn()
        self.removeFromSuperview()
        delegate?.openMenuAction(selectedValue: indexPath.row, viewController: menuArray[indexPath.row]["viewController"].string!)
    }
}

class ImageHelper {
    static func image(_ name: String) -> UIImage? {
        let podBundle = Bundle(for: ImageHelper.self) // for getting pod url
        if let url = podBundle.url(forResource: "SetColor", withExtension: "xcassets") { //<YourBundleName> must be the same as you wrote in .podspec
            let bundle = Bundle(url: url)
            return UIImage(named: name, in: bundle, compatibleWith: nil)
        }
        return UIImage()
    }
}
