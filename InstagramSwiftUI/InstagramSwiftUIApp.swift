//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUIApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel()) // ObservableObjectプロトコルに準拠したデータクラス（classのインスタンス）とViewを紐付け
//            LoginView().environmentObject(AuthViewModel())
        }
    }
}
