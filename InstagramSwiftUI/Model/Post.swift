//
//  Post.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/09.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
    var user: User? // for navigating user profile from the feed
}
