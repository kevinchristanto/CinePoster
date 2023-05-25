//
//  MovieGenreIdentifier.swift
//  CinePoster
//
//  Created by Kevin Christanto on 22/05/23.
//

import CoreML
import Vision
import CoreImage

struct Classifier {
    
    private(set) var results: [String]?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: MovieIdentifier(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let tempResults = request.results as? [VNClassificationObservation] else {
            return
        }
        
        results = []
        tempResults.prefix(2).forEach{ result in
            results?.append(result.identifier)
        }
        print(results?.first)
        print("test")
//        if let firstResult = results.first {
//            self.results = firstResult.identifier
//        }
        
    }
    
    func test(){
        print("ab")
    }
    
}


//import Foundation
//import CoreML
//import SwiftUI
//import Vision
//
//struct imageClassification {
//    @State private var isPresented = false
//    @State private var selectedImage: UIImage?
//    @State private var classificationResult: String = ""
//    private let imageClassifier = ImageClassifier()
//
//    func classifyImage() {
//        guard let selectedImage = selectedImage else {
//            return
//        }
//
//        imageClassifier.classifyImage(selectedImage) { result, error in
//            if let error = error {
//                print("Classification error: \(error)")
//                return
//            }
//
//            if let result = result {
//                self.classificationResult = result
//            }
//        }
//    }
//
//
//    class ImageClassifier {
//        private let model: MovieIdentifier
//
//        init() {
//            do {
//                model = try MovieIdentifier(configuration: MLModelConfiguration())
//            } catch {
//                fatalError("Failed to create an instance of the Core ML model: \(error)")
//            }
//        }
//
//        func classifyImage(_ image: UIImage, completionHandler: @escaping (String?, Error?) -> Void) {
//            // Convert the UIImage to a Core ML input format
//            guard let pixelBuffer = image.pixelBuffer(width: 224, height: 224) else {
//                completionHandler(nil, ImageClassificationError.invalidImage)
//                return
//            }
//
//            do {
//                // Create a Vision Core ML model from your Core ML model
//                let coreMLModel = try VNCoreMLModel(for: model.model)
//
//                // Create a Vision request using the Vision Core ML model
//                let request = VNCoreMLRequest(model: coreMLModel) { request, error in
//                    guard let results = request.results as? [VNClassificationObservation], let firstResult = results.first else {
//                        completionHandler(nil, error)
//                        return
//                    }
//
//                    // Get the top two classification results
//                    let topTwoResults = Array(results.prefix(2)).map { ($0.identifier, $0.confidence) }
//                    let resultString = topTwoResults.map { "\($0): \($1)" }.joined(separator: ", ")
//                    completionHandler(resultString, nil)
//                }
//
//                // Perform the classification request
//                let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
//                try handler.perform([request])
//            } catch {
//                completionHandler(nil, error)
//            }
//        }
//    }
//
//    enum ImageClassificationError: Error {
//        case invalidImage
//    }
//}
//
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
//
//extension UIImage {
//    func pixelBuffer(width: Int, height: Int) -> CVPixelBuffer? {
//        var pixelBuffer: CVPixelBuffer?
//        let attributes: [String: Any] = [
//            kCVPixelBufferCGImageCompatibilityKey as String: kCFBooleanTrue!,
//            kCVPixelBufferCGBitmapContextCompatibilityKey as String: kCFBooleanTrue!,
//            kCVPixelBufferWidthKey as String: width,
//            kCVPixelBufferHeightKey as String: height
//        ]
//
//        let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32ARGB, attributes as CFDictionary, &pixelBuffer)
//
//        if status != kCVReturnSuccess {
//            return nil
//        }
//
//        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
//        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
//
//        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.noneSkipFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
//        let context = CGContext(
//            data: pixelData,
//            width: width,
//            height: height,
//            bitsPerComponent: 8,
//            bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!),
//            space: rgbColorSpace,
//            bitmapInfo: bitmapInfo.rawValue
//        )
//
//        context?.translateBy(x: 0, y: CGFloat(height))
//        context?.scaleBy(x: 1, y: -1)
//
//        UIGraphicsPushContext(context!)
//        draw(in: CGRect(x: 0, y: 0, width: width, height: height))
//        UIGraphicsPopContext()
//        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
//
//        return pixelBuffer
//    }
//}
