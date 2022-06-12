//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/06/12.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @Environment(\.presentationMode) var mode
    @Binding var user: User // Define user to update bio after saving it
    @ObservedObject private var viewModel: EditProfileViewModel
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue) // don't still understand why using wrappedValue
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { mode.wrappedValue.dismiss() }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: { viewModel.saveUserBio(bioText) }) {
                    Text("Done").bold()
                }
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio // set binding user (this is different with the user in EditProfileViewModel)
            }
        }
    }
}
