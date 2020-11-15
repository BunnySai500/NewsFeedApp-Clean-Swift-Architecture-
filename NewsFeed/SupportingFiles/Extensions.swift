//
//  Extensions.swift
//  NewsFeed
//
//  Created by Bunny Bhargav on 23/10/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit


protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}
protocol Localizable {
    var localized: String { get }
}


extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}


extension String{
    func localizedString() -> String
    {
    guard let lang = UserDefaults.standard.object(forKey: "language") as? String else {return ""}
    let path = Bundle.main.path(forResource: lang, ofType: "lproj")
    guard let lpath = path else {return ""}
    guard let bundle = Bundle(path: lpath) else {return ""}
    return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
}
