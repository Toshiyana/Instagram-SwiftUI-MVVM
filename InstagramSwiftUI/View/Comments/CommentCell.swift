//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/10.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    @ObservedObject var viewModel: CommentCellViewModel
    
    init(viewModel: CommentCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.comment.user {
                NavigationLink(destination: LazyView(ProfileView(user: user))) {
                    KFImage(URL(string: viewModel.comment.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                    
                    Text(viewModel.comment.username)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                }
            }
            
            Text(" \(viewModel.comment.commentText)")
                .font(.system(size: 14))
            
            Spacer()
            
            Text(" \(viewModel.timestampString)")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}
