//
//  LoginView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 02/07/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.1843137255, green: 0.631372549, blue: 0.9529411765, alpha: 1)).ignoresSafeArea()
                
                VStack {
                    Image("twitter")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom, 32)
                    
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
                    
                    Button(action: {viewModel.login(withEmail: email, password: password)}) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    }.disabled(viewModel.isAuthenticating)
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    }
                }
                .overlay(
                    VStack {
                        Text("Loading...")
                        SpinnerActivityIndicator(shouldAnimate: $viewModel.isAuthenticating, style: .large)
                    }
                    .frame(width: 100,
                           height: 100)
                    .background(BlurView(style: .systemMaterial))
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(viewModel.isAuthenticating ? 1 : 0)
                )
                
            }
            .showToast(viewModel.isError ?? "unable to login", isPresented: $viewModel.showError, color: Color.primary.opacity(0.5), duration: 2, alignment: .bottom, toastType: .offsetToast)
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
