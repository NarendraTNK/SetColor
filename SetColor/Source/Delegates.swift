//
//  Delegates.swift
//  ECGame
//
//  Created by hfcb on 08/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Road Map Delegate
//This is the delegate for the RoadMapView. The RoadMapView visible when you launch application and user is signed-in. It is an XIB which later on added on GameViewController.



/* open side menu option */
protocol menuOpen:  class {
    func openMenuAction(selectedValue : Int, viewController : String)
}

protocol LanguageDelegate {
    func changeSelectedLanguage(selectedLanguageIndex : Int)
}
