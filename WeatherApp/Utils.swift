//
//  Utils.swift
//  WeatherApp
//
//  Created by AYA on 16/05/2024.
//

import Foundation
import UIKit

class Utils{
    static func getImageFromUrl(imageCode: Double) -> UIImage? {
            switch imageCode {
            case 1000:
                return UIImage(named: "clear_sky_day_1")
            case 1009:
                return UIImage(named: "clear_sky_night")
            case 1003,1006:
                return UIImage(named: "clouds_day")
            case 1279:
                return UIImage(named: "clouds_night")
            case 1063,1180,1189:
                return UIImage(named: "rain_day")
            case 1135,1183,1186,1192,1195,1198:
                return UIImage(named: "rain_night")
            case 1072:
                return UIImage(named: "thunder_day")
            case 1087:
                return UIImage(named: "thunder_night")
            case 1066,1213:
                return UIImage(named: "snow_day")
            case 1114,1147,1222:
                return UIImage(named: "snow_night")
            case 1030:
                return UIImage(named: "mist_day")
            case 1117:
                return UIImage(named: "mist_night")
            default:
                print(imageCode)
                return UIImage(named: "snow_night")
            }
        }
    
    static func isDay(fromTimestamp timestamp: TimeInterval) -> Bool {
            let date = Date(timeIntervalSince1970: timestamp)
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            return (hour >= 5 && hour < 18)
        }
    
    static func dayOfWeek(fromTimestamp time: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: time){
            let calendar = Calendar.current
            let dayOfWeek = calendar.component(.weekday, from: date)
            let dayOfWeekString = dateFormatter.weekdaySymbols[dayOfWeek - 1]
            return dayOfWeekString
        } else {
            return nil
        }
    }

    static func extractTime(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = dateFormatter.date(from: dateString) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            return timeFormatter.string(from: date)
        } else {
            return nil
        }
    }
   
}
