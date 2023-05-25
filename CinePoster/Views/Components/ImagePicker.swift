//
//  ImagePicker.swift
//  CinePoster
//
//  Created by Kevin Christanto on 22/05/23.
//

import UIKit
import SwiftUI
import PhotosUI

//struct ImagePicker: View {
//    
//    @State var selectedItems : [PhotosPickerItem] = []
//    @State var data : Data?
//    
//    
//    var body: some View {
//        VStack{
//            
//            if let data = data, let uiimage = UIImage(data: data){
//                Image(uiImage: uiimage)
//                    .resizable()
//            }
//            
//            PhotosPicker(selection: $selectedItems, matching: .images){
//                Text("Pick photo")
//            }.onChange(of: selectedItems) { newValue in
//                guard let item = selectedItems.first else {
//                return}
//                
//                item.loadTransferable(type: Data.self)  { result in
//                    switch result {
//                    
//                case .success(let data):
//                    
//                    if let data  = data {
//                        self.data = data
//                    }else {
//                        print("data is nil")
//                    }
//                    
//                    
//                case .failure(let failure):
//                    
//                    fatalError("\(failure)")
//                    
//                 
//                }
//                
//            }
//                
//            }
//            
//        }
//    }
//}
//
//
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var uiImage: UIImage?
    @Binding var isPresenting: Bool
    @Binding var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        let parent: ImagePicker

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.uiImage = info[.originalImage] as? UIImage
            parent.isPresenting = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresenting = false
        }

        init(_ imagePicker: ImagePicker) {
            self.parent = imagePicker
        }
    }

//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var selectedImage: UIImage?
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//        // No update needed
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(selectedImage: $selectedImage)
//    }
//
//    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        @Binding var selectedImage: UIImage?
//
//        init(selectedImage: Binding<UIImage?>) {
//            _selectedImage = selectedImage
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                selectedImage = uiImage
//            }
//
//            picker.dismiss(animated: true)
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//    }
//}

//struct ImagePicker: UIViewControllerRepresentable {
//    var sourceType: UIImagePickerController.SourceType
//    @Binding var selectedImage: UIImage?
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = sourceType
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        let parent: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.selectedImage = uiImage
//            }
//
//            picker.dismiss(animated: true)
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//    }
//}

