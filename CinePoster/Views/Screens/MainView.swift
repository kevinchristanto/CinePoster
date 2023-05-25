//
//  Homepage.swift
//  CinePoster
//
//  Created by Kevin Christanto on 21/05/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var isShowingOnboarding = true
    @ObservedObject var movieViewModel = MovieViewModel()
    
    var body: some View {
        @State var selection = Tab.collection
        TabView{
            CollectionView(classifier: ImageClassifier())
                .environmentObject(movieViewModel)
                .tabItem{
                    Label(Prompt.Title.colletion, systemImage: Prompt.Image.collection)
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.collection)
            
            GenreView()
                .environmentObject(movieViewModel)
                .tabItem{
                    Label(Prompt.Title.genre, systemImage: Prompt.Image.genre)
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.genre)
        }
        .accentColor(AppColor.primary)
        .sheet(isPresented: $isShowingOnboarding) {
            OnboardingView(isPresented: $isShowingOnboarding)
        }
    }
    
    enum Tab: Int {
        case collection = 1
        case genre = 2
        
    }
    
    struct Homepage_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
