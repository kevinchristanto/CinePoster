//
//  genreView.swift
//  CinePoster
//
//  Created by Kevin Christanto on 21/05/23.
//

import SwiftUI

struct GenreView: View {
    
    var body: some View {
        Text("Coming Soon!!!")
            .font(.title)
            .bold()
    }
    
    struct genreView_Previews: PreviewProvider {
        static var previews: some View {
            GenreView()
        }
    }
}

//class MovieViewModel: ObservableObject {
//    @Published var selectedGenre: String?
//
//
//    private let allGenres = ["Action", "Adventure", "Comedy", "Drama", "Horror", "Others", "Romance", "Sci-Fi", "Thriller"]
//
//    var filteredMovies: [Movie] {
//            // Filter movies based on selected genre
//            if let genre = selectedGenre {
//                return movies.filter { $0.genre.contains(genre) }
//            } else {
//                return movies
//            }
//        }
//
//    var genres: [String] {
//            return [nil] + allGenres
//        }
//}
//
//
//let movies: [Movie] = [
//    Movie(name: "Movie 1", genre: ["Action"]),
//    Movie(name: "Movie 2", genre: ["Comedy", "Drama"]),
//    Movie(name: "Movie 3", genre: ["Drama"]),
//    Movie(name: "Movie 4", genre: ["Thriller"]),
//    // Add more movies with genres as needed
//]
//
//
