//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/06.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            // 全てのUserを取得
            // pattern1: compactMapを使用 (こっちの方がシンプル)
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            
            // pattern2: forEachを利用
//            documents.forEach { snapshot in
//                guard let user = try? snapshot.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            
            print(self.users)
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) ||
            $0.username.lowercased().contains(lowercasedQuery) })
    }
}
