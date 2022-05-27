//
//  Extensions.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
