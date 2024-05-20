//
//  ViewModel.swift
//  WeatherApp
//
//  Created by AYA on 13/05/2024.
//

import Foundation


class ViewModel:ViewModelProtocol{
    func getDataFromNetwork() {
        Network.shared.fetchData {[weak self] result in
            switch result {
            case .success(let success):
                print("Success ViewModel \(success.current)")
                self?.notifyViewCurrentData(success.current!)
                self?.notifyViewForcastData((success.forecast?.forecastday!)!)
                self?.notifyViewLocationData(success.location!)
            case .failure(let failure):
                self?.failedWithError(failure.localizedDescription)
            }
           
        }
    }
    
    var notifyViewCurrentData: ((WeatherCurrent) -> ()) = {_ in }
    
    var notifyViewForcastData: (([ForecastDay]) -> ()) = {_ in }
    
    var notifyViewLocationData: ((WeatherLocation) -> ()) = {_ in }
    
    var failedWithError: ((String) -> ()) = {_ in }
    
}
