//
//  TitlesView.swift
//  PatallaxZoomAnimationSwiftUI
//
//  Created by Danae Davelaar on 30/10/2021.
//

import SwiftUI

struct TitlesView: View {
    
    let movies:  [Movie]
    let pageTitle: String
    var body: some View {
        VStack (alignment: .leading){
            Text(pageTitle)
            
            ScrollView (.horizontal, showsIndicators: false){
                HStack(spacing: 15) {
                    ForEach(movies) { movie in
                            VStack {
                                Image(movie.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 175)
                                    .clipped()
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                                Spacer()
                                Text(movie.title)
                                    //.fixedSize(horizontal: true, vertical: false)
                                    
                            }
                                .frame(width: 100, height: 200)
                    }
                }
            }
        }.padding(25)
    }
    
}
