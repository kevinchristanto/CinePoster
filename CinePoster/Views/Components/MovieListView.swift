//
//  MovieListView.swift
//  CinePoster
//
//  Created by Kevin Christanto on 22/05/23.
//

import SwiftUI

struct MovieListView: View {
    var movie: Movies
    var body: some View {
        NavigationLink{
            ResultView(movies: Movie(imagePoster:  UIImage(data: movie.moviePoster!)!, title: movie.movieName!, genre1: movie.movieGenre1!, genre2: movie.movieGenre2!))
        }label: {
          HStack  {
                if let imageData = movie.moviePoster,
                   let uiImage = UIImage(data: imageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.movieName!)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("\(movie.movieGenre1!), \(movie.movieGenre2!)")
                        .font(.subheadline)
                    }
                }
            }
        }
    }
