//
//  Comment.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/10.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
    var user: User? // for navigating user profile from the comment
}
