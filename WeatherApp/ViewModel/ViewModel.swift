//
//  ViewModel.swift
//  WeatherApp
//
//  Created by AYA on 13/05/2024.
//

import Foundation
import CoreLocation


class ViewModel:ViewModelProtocol{
    
   
//    func getDataFromNetwork(lat:Double,long:Double) {
//        Network.shared.fetchData(lat: lat, long: lat) {[weak self] result in
//            switch result {
//            case .success(let success):
//                self?.notifyViewCurrentData(success.current!)
//                self?.notifyViewForcastData((success.forecast?.forecastday!)!)
//                self?.notifyViewLocationData(success.location!)
//            case .failure(let failure):
//                self?.failedWithError(failure.localizedDescription)
//            }
//
//        }
//    }
    func getDataFromNetwork() {
           Network.shared.fetchData{[weak self] result in
               switch result {
               case .success(let success):
                   self?.notifyViewCurrentData(success.current!)
                   self?.notifyViewForcastData((success.forecast?.forecastday!)!)
                   self?.notifyViewLocationData(success.location!)
               case .failure(let failure):
                   self?.failedWithError(failure.localizedDescription)
               }
   
           }
       }
    func getAddressEnglish(lat: Double, lon: Double, completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: lon)
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Reverse geocoding failed with error: \(error.localizedDescription)")
                completion(nil)
            } else if let placemark = placemarks?.first {
                var result = ""
                if let adminArea = placemark.administrativeArea {
                    result += adminArea
                }
                if let country = placemark.country {
                    if !result.isEmpty {
                        result += ", "
                    }
                    result += country
                }
                result = result.replacingOccurrences(of: " Governorate", with: "")
                completion(result)
            } else {
                completion("Unknown location")
            }
        }
    }
    
    var notifyViewCurrentData: ((WeatherCurrent) -> ()) = {_ in }
    
    var notifyViewForcastData: (([ForecastDay]) -> ()) = {_ in }
    
    var notifyViewLocationData: ((WeatherLocation) -> ()) = {_ in }
    
    var failedWithError: ((String) -> ()) = {_ in }
    
}
