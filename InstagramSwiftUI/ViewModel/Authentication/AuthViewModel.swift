//
//  AuthViewModel.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/01.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login() {
        print("login")
    }
    
    func register() {
        print("register")
    }
    
    func singout() {
        
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
