//
//  NotificationsView.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(notification: notification)
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
