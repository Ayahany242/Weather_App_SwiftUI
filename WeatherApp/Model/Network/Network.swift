//
//  Network.swift
//
//  WeatherApp
//
//  Created by AYA on 13/05/2024.
//

import Foundation
import Alamofire

//http://api.weatherapi.com/v1/forecast.json?key=c758a8d6d720494588c192301241305&q=30.0715495,31.02&days=3&aqi=yes&alerts=no

//http://api.weatherapi.com/v1/forecast.json?key=c758a8d6d720494588c192301241305&q=30.0715495,31.02
let api = "https://api.weatherapi.com/v1/forecast.json?key=c758a8d6d720494588c192301241305&q=30.0715495,31.02&days=3&aqi=yes&alerts=no"


class Network:NetworkProtocol{
    static let shared = Network()
    private init(){}
    
//    func fetchData(lat:Double, long:Double, complationHandler: @escaping (Result<WeatherResponse, Error>) -> Void) {
//        let api = "https://api.weatherapi.com/v1/forecast.json?key=c758a8d6d720494588c192301241305&q=\(lat),\(long)&days=3&aqi=yes&alerts=no"
//        let URl = URL(string: api)
//        guard let url = URl else{
//            return
//        }
//        AF.request(url).validate().response { response in
//            switch response.result {
//            case .success(let data):
//                do{
//                    let jsonData = try JSONDecoder().decode(WeatherResponse.self, from: data!)
//                    //print(jsonData.current)
//                    print("Success")
//                    complationHandler(.success(jsonData))
//                }catch{
//                    print("Failed in catch")
//                    print(error)
//                    complationHandler(.failure(error))
//
//                }
//            case .failure(let error):
//                print("Failed ")
//                complationHandler(.failure(error))
//            }
//        }
//    }
    func fetchData(complationHandler: @escaping (Result<WeatherResponse, Error>) -> Void) {
          
           let URl = URL(string: api)
           guard let url = URl else{
               return
           }
           AF.request(url).validate().response { response in
               switch response.result {
               case .success(let data):
                   do{
                       let jsonData = try JSONDecoder().decode(WeatherResponse.self, from: data!)
                       //print(jsonData.current)
                       print("Success")
                       complationHandler(.success(jsonData))
                   }catch{
                       print("Failed in catch")
                       print(error)
                       complationHandler(.failure(error))
   
                   }
               case .failure(let error):
                   print("Failed ")
                   complationHandler(.failure(error))
               }
           }
       }
    
}
