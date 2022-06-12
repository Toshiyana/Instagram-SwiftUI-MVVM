//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/29.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel // AuthViewModelクラスのインスタンスを共有（データバインディング）
    
    var body: some View {
        NavigationView {
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
                        
                        // password field
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ResetPasswordView(email: $email)) {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                    }
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 330, height: 50)
                            .background(Color(.systemPurple))
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView().navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }.foregroundColor(.white)
                        }).padding(.bottom, 16)
                    
                }// VStack
                .padding(.top, -44)
            }// ZStack
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
