//
//  LazyView.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/11.
//

import SwiftUI

// Only make instance when accessing the view using LazyView
// -> become more efficient when fetching data with firebase
struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
