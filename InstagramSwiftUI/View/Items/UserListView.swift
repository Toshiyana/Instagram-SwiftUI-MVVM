//
//  UserListVIew.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                        })
                }
            }
        }
    }
}
