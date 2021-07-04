//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 02/07/21.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var fullName = ""
    @State var email = ""
    @State var userName = ""
    @State var password = ""
    
    @State private var selectedUIImage: UIImage?
    @State private var image: Image?
    
    @State var imagePickerSheet = false
    @State var openGallery = false
    @State var openCamera = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1843137255, green: 0.631372549, blue: 0.9529411765, alpha: 1)).ignoresSafeArea()
            
            VStack {
                Button(action: { self.imagePickerSheet.toggle() }) {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                                .padding(.top, 20)
                                .padding(.bottom, 16)
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 20)
                                .padding(.bottom, 16)
                                .foregroundColor(.white)
                        }
                    }
                }
                .sheet(isPresented: $openGallery, onDismiss: loadImage) {
                    ImagePicker(image: $selectedUIImage, sourceType: .photoLibrary)
                }
                .sheet(isPresented: $openCamera, onDismiss: loadImage) {
                    ImagePicker(image: $selectedUIImage, sourceType: .camera)
                }
                
                VStack(spacing: 20) {
                    CustomTextFields(text: $fullName, placeholder: Text("Full Name"), image: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextFields(text: $email, placeholder: Text("Email"), image: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextFields(text: $userName, placeholder: Text("User Name"), image: "person")
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
                
                Button(action: {
                    guard let profileImage = selectedUIImage else { return }
                    viewModel.registerUser(withEmail: email, password: password, image: profileImage, fullName: fullName, userName: userName)
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                }.disabled(viewModel.isAuthenticating)
                
                Spacer()
                
                BottomCardView(show: $imagePickerSheet, openGallery: $openGallery, openCamera: $openCamera)
                
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .opacity(imagePickerSheet ? 0 : 1)
                .animation(.easeInOut(duration: 0.8))
                .position(x: 220, y: -50)
            }
            .overlay(
                VStack {
                    Text("Loading...")
                    SpinnerActivityIndicator(shouldAnimate: $viewModel.isAuthenticating, style: .large)
                }
                .frame(width: 100, height: 100)
                .background(BlurView(style: .systemMaterial))
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(viewModel.isAuthenticating ? 1 : 0)
            )
            if viewModel.showError {
                VStack {}
                    .showToast(viewModel.isError ?? "unable to sign up", isPresented: $viewModel.showError, color: Color.primary.opacity(0.5), duration: 2, alignment: .bottom, toastType: .offsetToast)
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct BottomCardView: View {
    @Binding var show: Bool
    @Binding var openGallery: Bool
    @Binding var openCamera: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {self.openCamera.toggle(); self.show.toggle()}) {
                Text("Open Camera")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 0.2196078431, green: 0.631372549, blue: 0.9568627451, alpha: 1)))
                    .frame(width: 360, height: 50)
                    .background(BlurView(style: .systemMaterial))
                    .clipShape(Capsule())
            }
            
            Button(action: {self.openGallery.toggle(); self.show.toggle()}) {
                Text("Open Gallery")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 0.2196078431, green: 0.631372549, blue: 0.9568627451, alpha: 1)))
                    .frame(width: 360, height: 50)
                    .background(BlurView(style: .systemMaterial))
                    .clipShape(Capsule())
            }
            
            Button(action: {self.show.toggle()}) {
                Text("Dismiss")
                    .foregroundColor(.white)
                    .frame(width: 360, height: 50)
                    .background(Color.pink)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
        .frame(maxWidth: 712)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .frame(maxWidth: .infinity)
        .offset(x: 0, y: self.show ? 25 : UIScreen.main.bounds.height)
        .animation(.easeInOut(duration: 0.8))
        .edgesIgnoringSafeArea(.all)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
