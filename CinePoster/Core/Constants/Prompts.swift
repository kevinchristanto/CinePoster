//
//  Prompts.swift
//  CinePoster
//
//  Created by Kevin Christanto on 20/05/23.
//

import Foundation

struct Prompt { private init() {} }

extension Prompt {
    static let noHistory = "No History"
}

extension Prompt {
    struct Title {
        static let onboard = "Getting Started in CinePoster"
        static let colletion = "Collection"
        static let genre = "Genre"

        
        private init() {}
    }
    
    struct Instructions {
        static let title1 = "Add Movie Poster"
        static let content1 = "Add movie poster by pressing the ‘+’ button on the upper left of the screen."
        
        static let title2 = "View Genre Prediction"
        static let content2 = "View genre prediction based on the movie poster you add."
        
        
        
        private init() {}
    }
    
    struct Image {
        static let plusCircle = "plus.circle"
        static let predict = "magnifyingglass"
        static let plus = "plus"
        static let collection = "rectangle.stack.fill"
        static let genre = "film.fill"
        static let photo = "photo"
        static let camera = "camera"
        
        private init() {}
    }
}

extension Prompt {
    struct Button {
        static let saveToHistory = "Save to history"
        static let next = "Continue"
        
        private init() {}
    }
}
