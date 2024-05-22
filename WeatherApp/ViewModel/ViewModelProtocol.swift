//
//  ViewModelProtocol.swift
//  WeatherApp
//
//  Created by AYA on 13/05/2024.
//

import Foundation

protocol ViewModelProtocol{
    //func getDataFromNetwork(lat:Double,long:Double)
    func getDataFromNetwork()
    var notifyViewCurrentData: ((WeatherCurrent)->()) { get set }
    var notifyViewForcastData: (([ForecastDay])->()) { get set }
    var notifyViewLocationData: ((WeatherLocation)->()) { get set }
    var failedWithError: ((String)->()) { get set }
    func getAddressEnglish(lat: Double, lon: Double, completion: @escaping (String?) -> Void)
}
