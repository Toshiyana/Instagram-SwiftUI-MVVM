//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("venom-7")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle()) // diff way with using cornerradius
            
            // VStack -> username, fullname
            VStack(alignment: .leading) {
                Text("username")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("fullname")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
