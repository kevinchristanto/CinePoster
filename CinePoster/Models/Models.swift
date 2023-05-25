//
//  Models.swift
//  CinePoster
//
//  Created by Kevin Christanto on 22/05/23.
//

import SwiftUI
import Foundation

struct Movie: Identifiable {
    var id: UUID = UUID()
    var imagePoster: UIImage
    var title: String
    var genre1: String
    var genre2: String
}
