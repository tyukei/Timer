//
//  ContentView.swift
//  Timer
//
//  Created by KeitaNakata on 2023/08/02.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var dispYear = ""
    @State var dispMonth = ""
    @State var dispDay = ""
    @State var dispHour = ""
    @State var dispMinute = ""
    @State var dispSecond = ""

    @State var dispYearUS = ""
    @State var dispMonthUS = ""
    @State var dispDayUS = ""
    @State var dispHourUS = ""
    @State var dispMinuteUS = ""
    @State var dispSecondUS = ""

    @State var nowDate = Date()
    @State var nowDateUS = Date()

    private let dateFormatterYear = DateFormatter()
    private let dateFormatterMonth = DateFormatter()
    private let dateFormatterDay = DateFormatter()
    private let dateFormatterHour = DateFormatter()
    private let dateFormatterMinute = DateFormatter()
    private let dateFormatterSecond = DateFormatter()

    private let dateFormatterYearUS = DateFormatter()
    private let dateFormatterMonthUS = DateFormatter()
    private let dateFormatterDayUS = DateFormatter()
    private let dateFormatterHourUS = DateFormatter()
    private let dateFormatterMinuteUS = DateFormatter()
    private let dateFormatterSecondUS = DateFormatter()

    init(){
        dateFormatterYear.dateFormat = DateFormatter.dateFormat(fromTemplate: "y", options: 0, locale: Locale(identifier: "ja_JP"))
        dateFormatterMonth.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM", options: 0, locale: Locale(identifier: "ja_JP"))
        dateFormatterDay.dateFormat = DateFormatter.dateFormat(fromTemplate: "dd", options: 0, locale: Locale(identifier: "ja_JP"))
        dateFormatterHour.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH", options: 0, locale: Locale(identifier: "ja_JP"))
        dateFormatterMinute.dateFormat = DateFormatter.dateFormat(fromTemplate: "mm", options: 0, locale: Locale(identifier: "ja_JP"))
        dateFormatterSecond.dateFormat = DateFormatter.dateFormat(fromTemplate: "ss", options: 0, locale: Locale(identifier: "ja_JP"))

        dateFormatterYearUS.dateFormat = DateFormatter.dateFormat(fromTemplate: "y", options: 0, locale: Locale(identifier: "en_US"))
        dateFormatterMonthUS.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM", options: 0, locale: Locale(identifier: "en_US"))
        dateFormatterDayUS.dateFormat = DateFormatter.dateFormat(fromTemplate: "dd", options: 0, locale: Locale(identifier: "en_US"))
        dateFormatterHourUS.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH", options: 0, locale: Locale(identifier: "en_US"))
        dateFormatterMinuteUS.dateFormat = DateFormatter.dateFormat(fromTemplate: "mm", options: 0, locale: Locale(identifier: "en_US"))
        dateFormatterSecondUS.dateFormat = DateFormatter.dateFormat(fromTemplate: "ss", options: 0, locale: Locale(identifier: "en_US"))
    
    }

    var body: some View {
        VStack {
            HStack{
                Text(dispYear.isEmpty ? "\(dateFormatterYear.string(from: nowDate))" : dispYear).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDate = Date()
                            dispYear = "\(dateFormatterYear.string(from: nowDate))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispMonth.isEmpty ? "\(dateFormatterMonth.string(from: nowDate))" : dispMonth).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDate = Date()
                            dispMonth = "\(dateFormatterMonth.string(from: nowDate))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispDay.isEmpty ? "\(dateFormatterDay.string(from: nowDate))" : dispDay).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDate = Date()
                            dispDay = "\(dateFormatterDay.string(from: nowDate))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                }
            HStack{
                Text(dispHour.isEmpty ? "\(dateFormatterHour.string(from: nowDate))" : dispHour).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDate = Date()
                            dispHour = "\(dateFormatterHour.string(from: nowDate))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispMinute.isEmpty ? "\(dateFormatterMinute.string(from: nowDate))" : dispMinute).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDate = Date()
                            dispMinute = "\(dateFormatterMinute.string(from: nowDate))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispSecond.isEmpty ? "\(dateFormatterSecond.string(from: nowDate))" : dispSecond).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDate = Date()
                            dispSecond = "\(dateFormatterSecond.string(from: nowDate))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
            }
        }
        VStack{
            HStack{
                Text(dispYearUS.isEmpty ? "\(dateFormatterYearUS.string(from: nowDateUS))" : dispYearUS).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDateUS = Date()
                            dispYearUS = "\(dateFormatterYearUS.string(from: nowDateUS))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispMonthUS.isEmpty ? "\(dateFormatterMonthUS.string(from: nowDateUS))" : dispMonthUS).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDateUS = Date()
                            dispMonthUS = "\(dateFormatterMonthUS.string(from: nowDateUS))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispDayUS.isEmpty ? "\(dateFormatterDayUS.string(from: nowDateUS))" : dispDayUS).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDateUS = Date()
                            dispDayUS = "\(dateFormatterDayUS.string(from: nowDateUS))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
            }
            HStack{
                Text(dispHourUS.isEmpty ? "\(dateFormatterHourUS.string(from: nowDateUS))" : dispHourUS).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDateUS = Date()
                            dispHourUS = "\(dateFormatterHourUS.string(from: nowDateUS))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispMinuteUS.isEmpty ? "\(dateFormatterMinuteUS.string(from: nowDateUS))" : dispMinuteUS).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDateUS = Date()
                            dispMinuteUS = "\(dateFormatterMinuteUS.string(from: nowDateUS))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
                Text(dispSecondUS.isEmpty ? "\(dateFormatterSecondUS.string(from: nowDateUS))" : dispSecondUS).onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.nowDateUS = Date()
                            dispSecondUS = "\(dateFormatterSecondUS.string(from: nowDateUS))"
                        }
                }.font(.system(size: 30,weight: .light,design: .rounded)).padding()
            }
        }
    }
}

    
