//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/12.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {}) {
                    Text("Done").bold()
                }
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
