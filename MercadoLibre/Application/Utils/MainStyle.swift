//
//  MainStyle.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 21/01/22.
//

import Foundation
import UIKit

struct MainStyle {
    static func applyStyle() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor : UIColor.text!]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor : UIColor.text!]
        navBarAppearance.backgroundColor = UIColor.primary
        
        UINavigationBar.appearance().tintColor = UIColor.text!
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
}

extension UIColor {
    static let primary = UIColor(named: "primary")
    static let text = UIColor(named: "text")
    static let background = UIColor(named: "background")
}
