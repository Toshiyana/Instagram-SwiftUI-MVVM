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
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user...")
        }
    }
    
    func singout() {
        
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
