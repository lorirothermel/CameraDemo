//
//  ContentView.swift
//  CameraDemo
//
//  Created by Lori Rothermel on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
       
    
    var body: some View {
        
            
        VStack {
            
            Spacer()
            
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 350)
                .contextMenu{
                    Button {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                       
                    } label: {
                        Text("Save this picture to your Library?")
                        Image(systemName: "square.and.arrow.down.fill")
                    }
                }  // .contentMenu
                    
            Spacer()
            
            Button {
                self.isShowPhotoLibrary = true
            } label: {
                HStack {
                    Image(systemName: "camera")
                        .font(.system(size: 20))
                    Text("Camera")
                        .font(.headline)
                }  // HStack
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
            }  // Button
            
        }  // VStack
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: .camera)
        }  // .sheet
     
        
    }  // some View
}  // ContentView





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
