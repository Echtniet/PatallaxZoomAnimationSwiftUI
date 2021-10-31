//
//  NotFlix.swift
//  NotFlix
//
//  Created by Danae Davelaar on 31/10/2021.
//

import WidgetKit
import SwiftUI
import Intents

struct NotFlixEntry: TimelineEntry{
    let date: Date
}

struct Provider: TimelineProvider {
    func getSnapshot(in context: Context, completion: @escaping (NotFlixEntry) -> Void) {
        let entry = NotFlixEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<NotFlixEntry>) -> Void) {
        let date = Date()
        let entry =  NotFlixEntry(date: date)
        
        //let nextUpdateDate = Calendar.current.date(byAdding: .second, value: 15, to: date)!
            
        let timeline = Timeline(entries: [entry], policy: .atEnd )
        completion(timeline)
    }
    
    func placeholder(in context: Context) -> NotFlixEntry {
        NotFlixEntry(date: Date())
    }
}

struct Movie: Identifiable {
    let id: Int
    let title, image: String
}

struct NotFlixEntryView : View {
    var entry: Provider.Entry
    
    let movies: [Movie] = [
        .init(id: 2, title: "The Avengers", image: "avenger"),
        .init(id: 3, title: "Loki", image: "loki"),
        .init(id: 4, title: "Black Panther", image: "bp"),
        .init(id: 5, title: "Infinity", image: "infinity"),
        .init(id: 6, title: "Endgame", image: "endgame"),
        .init(id: 7, title: "Far From Home", image: "ffh")
    ]

    var body: some View {
       
        GeometryReader { proxy in
                let maxX = proxy.frame(in: .global).maxX
                let maxY = proxy.frame(in: .global).maxY
            HStack (spacing: 10) {
                ForEach(0..<3) { i in
                    ZStack {
                        let movies2 = movies.shuffled()
                        Image(movies2[i].image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: (maxX - 40) / 3 , height: (maxY - 20))
                            .clipped()
                            .cornerRadius(15)
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                StrokeText(text: "\(i + 1)", width: 0.8, color: .white)
                                    .font(.system(size: 40, weight: .bold))
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 5)
                                    .padding(.bottom, 5)
                            }
                        }
                        
                    }
                }
            }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
        }
        
        
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

@main
struct NotFlix: Widget {
    let kind: String = "NotFlix"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            NotFlixEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}
