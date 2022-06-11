//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var showPostImage = true
    var body: some View {
        
        HStack {
            KFImage(URL(string: viewModel.notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold)) +
            Text(viewModel.notification.type.notificationMessage)
                .font(.system(size: 15))
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                Image("venom-7")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                })
            }
        }.padding(.horizontal)
    }
}
