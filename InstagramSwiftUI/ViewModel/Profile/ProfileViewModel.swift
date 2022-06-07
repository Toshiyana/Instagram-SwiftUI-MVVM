//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/06.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        print("DEBUG: Unfollow user..")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
