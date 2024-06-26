//
//  DataModel.swift
//  WeatherApp
//
//  Created by AYA on 13/05/2024.
//

import Foundation
import Foundation

struct WeatherResponse: Codable {
    let location: WeatherLocation?
    let current: WeatherCurrent?
    let forecast: WeatherForecast?
}

struct WeatherLocation: Codable {
    let name: String?
    let region: String?
    let country: String?
    let lat: Double?
    let lon: Double?
    let tz_id: String?
    let localtime_epoch: Double?
    let localtime: String?
}

struct WeatherCurrent: Codable {
    let last_updated_epoch: Int?
    let last_updated: String?
    let temp_c: Double?
    let temp_f: Double?
    let is_day: Int?
    let condition: WeatherCondition?
    let wind_mph: Double?
    let wind_kph: Double?
    let wind_degree: Int?
    let wind_dir: String?
    let pressure_mb: Double?
    let pressure_in: Double?
    let precip_mm: Double?
    let precip_in: Double?
    let humidity: Int?
    let cloud: Int?
    let feelslike_c: Double?
    let feelslike_f: Double?
    let vis_km: Double?
    let vis_miles: Double?
    let uv: Double?
    let gust_mph: Double?
    let gust_kph: Double?
    let air_quality: AirQuality?
}

struct WeatherCondition: Codable {
    let text: String?
    let icon: String?
    let code: Double?
}

struct AirQuality: Codable {
    let co: Double?
    let no2: Double?
    let o3: Double?
    let so2: Double?
    let pm2_5: Double?
    let pm10: Double?
    let us_epa_index: Int?
    let gb_defra_index: Int?
}

struct WeatherForecast: Codable {
    let forecastday: [ForecastDay]?
}

struct ForecastDay: Codable, Identifiable {
    var id: Int?
    
    let date: String?
    let date_epoch: Double?
    let day: ForecastDetails?
    let astro: Astro?
    let hour: [HourlyForecast]?
}

struct ForecastDetails: Codable {
    let maxtemp_c: Double?
    let maxtemp_f: Double?
    let mintemp_c: Double?
    let mintemp_f: Double?
    let avgtemp_c: Double?
    let avgtemp_f: Double?
    let maxwind_mph: Double?
    let maxwind_kph: Double?
    let totalprecip_mm: Double?
    let totalprecip_in: Double?
    let totalsnow_cm: Double?
    let avgvis_km: Double?
    let avgvis_miles: Double?
    let avghumidity: Int?
    let daily_will_it_rain: Int?
    let daily_chance_of_rain: Int?
    let daily_will_it_snow: Int?
    let daily_chance_of_snow: Int?
    let condition: WeatherCondition?
    let uv: Double?
    let air_quality: AirQuality?
}

struct Astro: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moon_phase: String?
    let moon_illumination: Int?
    let is_moon_up: Int?
    let is_sun_up: Int?
}

struct HourlyForecast: Codable,Identifiable {
    let id : Int?
    let time_epoch: Int?
    let time: String?
    let temp_c: Double?
    let temp_f: Double?
    let is_day: Int?
    let condition: WeatherCondition?
    let wind_mph: Double?
    let wind_kph: Double?
    let wind_degree: Int?
    let wind_dir: String?
    let pressure_mb: Double?
    let pressure_in: Double?
    let precip_mm: Double?
    let precip_in: Double?
    let snow_cm: Double?
    let humidity: Int?
    let cloud: Int?
    let feelslike_c: Double?
    let feelslike_f: Double?
    let windchill_c: Double?
    let windchill_f: Double?
    let heatindex_c: Double?
    let heatindex_f: Double?
    let dewpoint_c: Double?
    let dewpoint_f: Double?
    let will_it_rain: Int?
    let chance_of_rain: Int?
    let will_it_snow: Int?
    let chance_of_snow: Int?
    let vis_km: Double?
    let vis_miles: Double?
    let gust_mph: Double?
    let gust_kph: Double?
    let uv: Double?
    let air_quality: AirQuality?
}
