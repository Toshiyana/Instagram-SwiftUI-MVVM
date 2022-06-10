//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/10.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("venom-7")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("venom-7").font(.system(size: 14, weight: .semibold)) +
                Text(" some test comment for now").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
