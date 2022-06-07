//
//  UploadPostView.swift
//  InstagramSwiftUI
//
//  Created by Toshiyana on 2022/05/27.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State private var captionText = ""
    @State private var showingPhotoLibPicker = false
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: { showingPhotoLibPicker.toggle() }, label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }).sheet(isPresented: $showingPhotoLibPicker, onDismiss: loadImage, content: {
                    PhotoLibraryPicker(image: $selectedImage)
                })
                
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption..", text: $captionText)
                }.padding()
                
                Button(action: {
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image)
                    }
                }, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }).padding()
            }
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
