//
//  CinePosterApp.swift
//  CinePoster
//
//  Created by Kevin Christanto on 20/05/23.
//

import SwiftUI

@main
struct CinePosterApp: App {
    
    @StateObject private var movieDataController = MovieDataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, movieDataController.container.viewContext)
        }
    }
}
