//
//  UIKitExtension.swift
//  OnlineGroceriesSwitfUI
//
//  Created by Erbay MAVZER on 6.08.2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        if self.isEmpty {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
