//  TimeTable.swift
//  Timer
//
//  Created by KeitaNakata on 2023/08/02.
//

import SwiftUI

struct TimeTable: View {
    let hours = Array(0..<24)
    
    @State var currentHourJapan: Int = Calendar.current.component(.hour, from: Date())
    @State var currentHourUS: Int = Calendar.current.component(.hour,from: Date().addingTimeInterval(-16 * 60 * 60))
    
    var timeSchedule: [Int] {
        var schedule = Array(currentHourJapan..<24)
        schedule += hours.filter { $0 < currentHourJapan }
        return schedule
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack {
                HStack{
                    IconView(hour:currentHourJapan)
                    Text("Koka")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.leading,-50)
                }
                HStack{
                    IconView(hour:currentHourUS)
                    Text("Merced")
                        .font(.headline)
                        .frame(maxWidth: .infinity)                }
            }
            .padding()
            
            Divider()
            
            List {
                ForEach(timeSchedule, id: \.self) { hour in
                    HStack {
                        Text(self.dateString(hour, timeZone: TimeZone(identifier: "Asia/Tokyo")!))
                        Spacer()
                        Text(self.dateString(hour, timeZone: TimeZone(secondsFromGMT: -6 * 60 * 60)!))
                    }
                    .listRowBackground(hour == currentHourJapan ? Color.yellow : Color.white)
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { timer in
                self.currentHourJapan = Calendar.current.component(.hour, from: Date())
            }
        }
    }
    
    func dateString(_ hour: Int, timeZone: TimeZone) -> String {
        var components = DateComponents()
        components.hour = hour
        let date = Calendar.current.date(from: components)!
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: date)
    }
}

struct TimeTable_Previews: PreviewProvider {
    static var previews: some View {
        TimeTable()
    }
}

struct IconView2: View {
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

