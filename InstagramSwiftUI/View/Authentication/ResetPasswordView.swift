//
//  ResetPasswordView.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/29.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding var email: String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image("Instagram_logo_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    // email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                }, label: {
                    Text("Send Reset Password Link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 330, height: 50)
                        .background(Color(.systemPurple))
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                })
                
            }// VStack
            .padding(.top, -44)
        }// ZStack
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}
