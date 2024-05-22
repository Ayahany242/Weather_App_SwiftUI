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
    var isDay:Bool
    var body: some View {
        HStack{
            textStyle(txt: Utils.dayOfWeek(fromTimestamp:  weatherData?.date ?? "unknown") ?? "unknown")
                //.foregroundColor(.white)
            Spacer()
            Image(uiImage: Utils.getImageFromUrl(imageCode: weatherData?.day?.condition?.code ?? 0.0)!)
                .resizable()
                .scaledToFit()
                .frame(width:40,height: 40)
                .padding()
            Spacer()
            textStyle(txt:"\(String(weatherData?.day?.mintemp_c ?? 0))° - \(String(weatherData?.day?.maxtemp_c ?? 0))°")
                //.foregroundColor(.white)
        }.padding(.horizontal,4)
            .frame(height: 30)
    }
    
    
    func textStyle(txt:String) -> Text{
        let color:Color = isDay ? .black : .white
        print("weather forcast \(weatherData?.date)")
       return Text(txt)
            .font(.system(size: 18))
            .foregroundColor(color)
        
    }
}

struct ForecastCellView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCellView(isDay: true)
    }
}
