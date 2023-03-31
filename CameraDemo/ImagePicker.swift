//
//  ImagePicker.swift
//  CameraDemo
//
//  Created by Lori Rothermel on 3/29/23.
//

import UIKit
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
        
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
 
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
 
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }  // init
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }  // if let image
     
            parent.presentationMode.wrappedValue.dismiss()
        }  // func imagePickerController
    }  // class Coordinator
    

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }  // func updateUIViewController
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }  // func makeCoordinator
    
}
