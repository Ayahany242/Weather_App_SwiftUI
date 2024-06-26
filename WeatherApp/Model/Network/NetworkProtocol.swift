//
//  NetworkProtocol.swift
//  WeatherApp
//
//  Created by AYA on 13/05/2024.
//

import Foundation

protocol NetworkProtocol{
    func fetchData(lat: Double, long: Double, complationHandler: @escaping (Result<WeatherResponse,Error>)-> Void)
    func fetchData(complationHandler: @escaping (Result<WeatherResponse,Error>)-> Void)
}
