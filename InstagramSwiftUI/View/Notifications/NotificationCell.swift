//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    let notification: Notification
    @State private var showPostImage = true
    
    var body: some View {
        
        HStack {
            KFImage(URL(string: notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(notification.username).font(.system(size: 14, weight: .semibold)) +
            Text(notification.type.notificationMessage)
                .font(.system(size: 15))
            
            Spacer()
            
            if notification.type != .follow {
                Image("venom-7")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {}, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }.padding(.horizontal)
    }
}
