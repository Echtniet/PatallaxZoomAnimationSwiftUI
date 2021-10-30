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
        .init(id: 1, title: "The Avengers", image: "avenger"),
        .init(id: 2, title: "Loki", image: "loki"),
        .init(id: 3, title: "Black Panther", image: "bp"),
        .init(id: 4, title: "Infinity", image: "infinity"),
        .init(id: 5, title: "Endgame", image: "endgame"),
        .init(id: 6, title: "Far From Home", image: "ffh")
    ]
    
    private func getScale(_ proxy: GeometryProxy) -> CGFloat {
        var scale:CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        let x2 = proxy.frame(in: .global).maxX
        
        
        let diff = abs(x - x2 / 2 )
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView (.horizontal){
                    HStack(spacing: 30) {
                        ForEach(movies) { movie in
                            GeometryReader { proxy in
                                VStack {
                                    let scale = getScale(proxy)
                                    Image(movie.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150)
                                        .clipped()
                                        .cornerRadius(5)
                                        .shadow(radius: 5)
                                        .scaleEffect(CGSize(width: scale, height: scale))
                                        .animation(.easeOut(duration: 0.5))
                                    Text(movie.title)
                                        .padding(.top)
                                }
                            }
                                .frame(width: 150, height: 300)
                        }
                    }.padding(32)
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
