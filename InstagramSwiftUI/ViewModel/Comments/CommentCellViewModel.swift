//
//  CommentCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/12.
//

import SwiftUI

class CommentCellViewModel: ObservableObject {
    @Published var comment: Comment
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: comment.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(comment: Comment) {
        self.comment = comment
        fetchCommentUser()
    }
    
    func fetchCommentUser() {
        COLLECTION_USERS.document(comment.uid).getDocument { snapshot, _ in
            self.comment.user = try? snapshot?.data(as: User.self)
            print("DEBUG: fetch comment user... \(self.comment.commentText)")
        }
    }
}
