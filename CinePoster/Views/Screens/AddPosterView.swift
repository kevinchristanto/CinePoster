//
//  addPoster.swift
//  CinePoster
//
//  Created by Kevin Christanto on 21/05/23.
//

import SwiftUI
import CoreML


struct AddPosterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    @State private var isAddingPhoto = false
    @State private var imageName = ""
    @State private var selectedImage: UIImage?
    //    @State private var fixedImage
    
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    @ObservedObject var classifier: ImageClassifier
    @State private var classificationResult: String = ""
    
    @State var shouldNavigate: Bool = false
    //    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var newMovie: Movie?
    
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            if shouldNavigate{
                ResultView(movies: newMovie!)
            }else{
                
                VStack {
                    //                NavigationLink(destination: ResultView(movies: Movie(imagePoster: (selectedImage ?? UIImage(named: "testing"))!, title: imageName, genre1: classifier.imageClass?[0] ?? "", genre2: classifier.imageClass?[1] ?? "")), isActive: $shouldNavigate){
                    //                    Text("")
                    //                }
                    //                .hidden()
                    Form {
                        Section(header: Text("Movie Poster")) {
                            Button(action: {
                                isPresented = true
                            }) {
                                if selectedImage != nil {
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                        .onAppear{
                                            classifier.detect(uiImage: selectedImage!)
                                        }
                                } else {
                                    
                                    HStack{
                                        Button{
                                            isAddingPhoto = true
                                            sourceType = .photoLibrary
                                        }label: {
                                            Image(systemName: Prompt.Image.photo)
                                                .font(.title)
                                                .foregroundColor(AppColor.primary)
                                        }
                                        Button{
                                            isAddingPhoto = true
                                            sourceType = .camera
                                        }label: {
                                            Image(systemName: Prompt.Image.camera)
                                                .font(.title)
                                                .foregroundColor(AppColor.primary)
                                        }
                                    }
                                }
                            }
                            .sheet(isPresented: $isAddingPhoto){
                                ImagePicker(uiImage: $selectedImage, isPresenting: $isAddingPhoto, sourceType: $sourceType)
                            }
                            
                        }
                        
                        Section(header: Text("Movie Name")){
                            TextField("Movie Name", text: $imageName)
                        }
                    }
                }
                .navigationBarTitle("Add Image")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    selectedImage = fixOrientation(img: selectedImage!)
                    
                    newMovie = Movie(imagePoster: selectedImage!, title: imageName, genre1: classifier.imageClass![0], genre2: classifier.imageClass![1])
                    
                    MovieDataController().addMovie(moviePoster: selectedImage!, movieName: imageName, movieGenre1: classifier.imageClass![0], movieGenre2: classifier.imageClass![1], context: managedObjContext)
                    
                    shouldNavigate = true
                    //                presentationMode.wrappedValue.dismiss()
                    
                    //                shouldNavigate = true
                    
                }) {
                    Text("Done")
                        .bold()
                        .accentColor(AppColor.primary)
                })
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("\(Image(systemName: "chevron.left")) Back")
                        .bold()
                        .accentColor(AppColor.primary)
                })
                
            }
        }
    }
}


struct addPoster_Previews: PreviewProvider {
    static var previews: some View {
        AddPosterView(classifier: ImageClassifier())
    }
}
