//
//  LoginView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 02/07/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("twitter")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 80)
                        .padding(.bottom, 40)
                    
                    VStack(spacing: 20) {
                        CustomTextFields(text: $email, placeholder: Text("Email"), image: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomSecureTextField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }.padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.top, 16)
                        .padding(.trailing, 32)
                    }
                    
                    Button(action: {}) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }
                }
            }
            .background(Color(#colorLiteral(red: 0.1843137255, green: 0.631372549, blue: 0.9529411765, alpha: 1))).ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
