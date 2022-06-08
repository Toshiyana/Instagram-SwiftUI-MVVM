//
//  UploadPostViewModel.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/07.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data: [String : Any] = ["caption": caption,
                                        "timestamp": Timestamp(date: Date()),
                                        "likes": 0,
                                        "imageUrl": imageUrl,
                                        "ownerUid": user.id ?? "",
                                        "ownerImageUrl": user.profileImageUrl,
                                        "ownerUsername": user.username]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}
