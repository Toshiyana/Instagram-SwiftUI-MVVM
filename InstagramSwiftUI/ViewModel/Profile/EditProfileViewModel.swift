//
//  EditProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/12.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User // this time, I don't use @Published.(maybe can use)
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserBio(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio // put before making uploadComplete true
            self.uploadComplete = true
        }
    }
}
