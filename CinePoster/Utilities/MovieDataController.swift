//
//  MovieDataController.swift
//  CinePoster
//
//  Created by Kevin Christanto on 22/05/23.
//

import Foundation
import CoreData
import UIKit

class MovieDataController: ObservableObject {
    let container = NSPersistentContainer(name: "MovieModel")
    
    init() {
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data Saved!! ")
        } catch {
            context.rollback()
            print("Could not save the data... Woohoo")
        }
    }
    
    func addMovie(moviePoster:UIImage, movieName: String, movieGenre1: String, movieGenre2: String, context: NSManagedObjectContext){
        let movie = Movies(context: context)
        movie.id = UUID()
        movie.movieName = movieName
        movie.moviePoster = moviePoster.pngData()
        movie.movieGenre1 = movieGenre1
        movie.movieGenre2 = movieGenre2

        save(context: context)
    }
    
    func editMovie(movie: Movies, name: String, context: NSManagedObjectContext){
        movie.movieName = name
        
        save(context: context)
    }
    func deleteMovie(movie: Movies, context: NSManagedObjectContext){
        context.delete(movie)

        save(context: context)
    }
}
