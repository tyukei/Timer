//
//  ContentView.swift
//  Timer
//
//  Created by KeitaNakata on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    @State var nowDate = Date()
    @State var nowDateUS = Date().addingTimeInterval(-16 * 60 * 60) // 9 hours difference
    let dateFormats = ["E", "MM", "dd", "HH", "mm", "ss"]

    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    CountryView(country: "Koka")
                    DateView(nowDate: $nowDate, locale: Locale(identifier: "en_US"), dateFormats: dateFormats)
                }.padding()
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.blue, lineWidth: 10))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding(.bottom,50)
                
                VStack{
                    CountryView(country: "Merced")
                    DateView(nowDate: $nowDateUS, locale: Locale(identifier: "en_US"), dateFormats: dateFormats)
                }.padding()
                .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.blue, lineWidth: 10))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    NavigationLink(destination: TimeTable().navigationTitle("TimeTable")) {
                        Text("TimeTable")
                            .padding(.top,100)
                    }
                }
                .onAppear {
                    let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        self.nowDateUS = Date().addingTimeInterval(-16 * 60 * 60) // 9 hours difference
                    }
                    RunLoop.current.add(timer, forMode: .common)
                }
            .navigationTitle("CurrentTime")
        }
    }
}

struct CountryView:View{
    var country:String
    var body: some View{
        VStack{
            Text(country)
                .font(.system(size: 50, weight: .heavy, design: .rounded))
        }
    }
}

struct DateView: View {
    @Binding var nowDate: Date
    var locale: Locale
    var dateFormats: [String]

    var body: some View {
        HStack{
            IconView(hour: Int(dateString(format: "HH", date: nowDate, locale: locale))!)
            VStack {
                HStack {
                    ForEach(dateFormats.prefix(3), id: \.self) { format in // E, Month, Day
                        Text(dateString(format: format, date: nowDate, locale: locale))
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                    }
                }
                HStack {
                    ForEach(dateFormats.dropFirst(3), id: \.self) { format in // Hour, Minute, Second
                        Text(dateString(format: format, date: nowDate, locale: locale))
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                    }
                }
            }
        }
    }

    private func dateString(format: String, date: Date, locale: Locale) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: format, options: 0, locale: locale)
        return formatter.string(from: date)
    }
}
struct IconView: View {
    var hour: Int
    
    var imageName: String {
        if 3 < hour && hour <= 6 {
            return "earlymorning"
        } else if 6 < hour && hour <= 9 {
            return "morning"
        } else if 9 < hour && hour <= 16 {
            return "noon"
        } else if 16 < hour && hour <= 18 {
            return "evening"
        } else if 18 < hour && hour <= 23 || 0 <= hour && hour <= 3 {
            return "night"
        } else {
            return "default" // return a default image name in case none of the conditions is met
        }
    }
    
    var body: some View {
        Image(uiImage: UIImage(named: imageName)!)
            .resizable()
            .frame(width: 70, height: 70)
    }
}

