//
//  User.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/06.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    // FirebaseFirestoreSwift libを使い、@ DocumentIDを定義することで、
    // Firesoreから取得したデータをカスタム型（ここではUser型）に直接デコード。
    // (使わない場合、Firestoreからdictionaryを取得して、いちいちデータをUser型で定義した変数に代入する必要があるので面倒)
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}
