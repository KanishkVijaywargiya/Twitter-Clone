//
//  ImageUploader.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 04/07/21.
//

import UIKit
import Firebase

enum UploadType {
    case profile
    case tweet
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        
        switch self {
        case .profile: return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .tweet: return Storage.storage().reference(withPath: "/tweet_images/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        
        let ref = type.filePath
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
