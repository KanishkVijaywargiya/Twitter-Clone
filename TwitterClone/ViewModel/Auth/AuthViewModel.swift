//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 04/07/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var isError: String?
    @Published var showError = false
    @Published var currentUser: User?
    
    init() {
        // it will check user is logged in or not. It will be current user data or nil value
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String,password: String) {
        UIApplication.shared.endEditing()
        isAuthenticating = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login Failed \(error.localizedDescription)")
                self.isError = error.localizedDescription
                self.isAuthenticating = false
                self.showError = true
                return
            }
            print("Successfully signed-In user", result?.user)
            self.userSession = result?.user
            self.isAuthenticating = false
        }
    }
    
    func registerUser(withEmail email: String?, password: String?, image: UIImage?, fullName: String?, userName: String?) {
        UIApplication.shared.endEditing()
        isAuthenticating = true
        guard let image = image else { return }
        guard let email = email else { return }
        guard let password = password else { return }
        guard let fullName = fullName else { return }
        guard let userName = userName else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    self.isError = error.localizedDescription
                    self.isAuthenticating = false
                    self.showError = true
                    return
                }
                guard let user = result?.user else { return }
                
                let data = ["email": email, "username": userName.lowercased(), "fullname": fullName, "profileImageUrl": imageUrl, "uid": user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    self.userSession = user
                    self.isAuthenticating = false
                }
                
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
