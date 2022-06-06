//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/06.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        print("DEBUG: Follow user..")
    }
    
    func unfollow() {
        print("DEBUG: Unfollow user..")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
