//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 02/07/21.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @State var fullName = ""
    @State var email = ""
    @State var userName = ""
    @State var password = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: { self.showImagePicker.toggle() }) {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .clipShape(Circle())
                                .padding(.top, 80)
                                .padding(.bottom, 16)
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 80)
                                .padding(.bottom, 16)
                                .foregroundColor(.white)
                        }
                    }
                }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $selectedUIImage)
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
                
                Button(action: {}) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                }
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .background(Color(#colorLiteral(red: 0.1843137255, green: 0.631372549, blue: 0.9529411765, alpha: 1))).ignoresSafeArea()
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
