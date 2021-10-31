//
//  ContentView.swift
//  PatallaxZoomAnimationSwiftUI
//
//  Created by Danae Davelaar on 30/10/2021.
//

import SwiftUI

struct Movie: Identifiable {
    let id: Int
    let title, image: String
}

struct ContentView: View {
    
    let movies: [Movie] = [
        .init(id: 1, title: "", image: ""),
        .init(id: 2, title: "The Avengers", image: "avenger"),
        .init(id: 3, title: "Loki", image: "loki"),
        .init(id: 4, title: "Black Panther", image: "bp"),
        .init(id: 5, title: "Infinity", image: "infinity"),
        .init(id: 6, title: "Endgame", image: "endgame"),
        .init(id: 7, title: "Far From Home", image: "ffh"),
        .init(id: 8, title: "", image: ""),
        .init(id: 9, title: "", image: "")
    ]
    
    let movies2: [Movie] = [
        .init(id: 2, title: "The Avengers", image: "avenger"),
        .init(id: 3, title: "Loki", image: "loki"),
        .init(id: 4, title: "Black Panther", image: "bp"),
        .init(id: 5, title: "Infinity", image: "infinity"),
        .init(id: 6, title: "Endgame", image: "endgame"),
        .init(id: 7, title: "Far From Home", image: "ffh")
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView (showsIndicators: false) {
                    MainView(movies: movies)
                        .padding(.horizontal, -182)
                        .padding(.bottom, -20)
                    TitlesView(movies: movies2.shuffled(), pageTitle: "Recommended Movies")
                        .padding(.top, -20)
                    TitlesView(movies: movies2.shuffled(), pageTitle: "Continue Watching")
                        .padding(.top, -20)
                    TitlesView(movies: movies2.shuffled(), pageTitle: "Watch Again")
                        .padding(.top, -20)
                }
            }
            .navigationBarTitle("Movies Carousel")
            .navigationBarHidden(true)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
