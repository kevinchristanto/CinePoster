//
//  Collection.swift
//  CinePoster
//
//  Created by Kevin Christanto on 20/05/23.
//

import SwiftUI
import CoreML

struct CollectionView: View {
    
    @State private var isShowingAddDataView = false
    @EnvironmentObject var movieViewModel: MovieViewModel
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @ObservedObject var classifier: ImageClassifier
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.movieName)]) var movies: FetchedResults<Movies>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies){ movie in
                    MovieListView(movie: movie)
                    
                }
                .onDelete(perform: deleteMovie)
            }
            
            .listStyle(.insetGrouped)
            .navigationBarTitle(Prompt.Title.colletion)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddDataView = true
                    }) {
                        Image(systemName: Prompt.Image.plus)
                            .foregroundColor(AppColor.primary)
                    }
                }
            }
            .sheet(isPresented: $isShowingAddDataView) {
                AddPosterView(classifier: ImageClassifier())
                    .environmentObject(movieViewModel)
            }
        }
    }
    
    private func deleteMovie(offsets: IndexSet) {
        withAnimation {
            offsets.map { movies[$0] }
                .forEach(managedObjContext.delete)
            
            // Saves to our database
            MovieDataController().save(context: managedObjContext)
        }
    }
}

struct collectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(classifier: ImageClassifier())
    }
}
