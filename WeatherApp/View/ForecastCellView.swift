//
//  ForecastCellView.swift
//  WeatherApp
//
//  Created by AYA on 14/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ForecastCellView: View {
    var weatherData : ForecastDay?
  
    var body: some View {
        HStack{
            Text(dateFormatter.string(from: Date(timeIntervalSince1970:weatherData?.date_epoch ?? 0.0)))
                //.foregroundColor(.white)
            Image(uiImage: Utils.getImageFromUrl(imageCode: weatherData?.day?.condition?.code ?? 0.0)!)
                .resizable()
                .scaledToFit()
                .frame(width:40,height: 40)
                .padding()
            Text("\(String(weatherData?.day?.mintemp_c ?? 0))° - \(String(weatherData?.day?.maxtemp_c ?? 0))°")
                //.foregroundColor(.white)
        }.padding(.horizontal,4)
            .frame(height: 30)
    }
    
let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "EEEE"
           return formatter
       }()
}

struct ForecastCellView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCellView()
    }
}
