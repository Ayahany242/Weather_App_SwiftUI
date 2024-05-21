//
//  DetailsView.swift
//  WeatherApp
//
//  Created by AYA on 14/05/2024.
//

import SwiftUI

struct DetailsView: View {
    var tempHourlyList : [HourlyForecast]?
    var isDay:Bool
    var body: some View {
        ScrollView{
            List(tempHourlyList ?? []){ temp in
                HStack{
                    textStyle(txt:Utils.extractTime(from: temp.time!) ?? "")
                        
                    Image(uiImage: Utils.getImageFromUrl(imageCode: temp.condition?.code ?? 0.0)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width:40,height: 40)
                        .padding()
                    textStyle(txt:"\(String(temp.temp_c ?? 0.0))°")
                }.padding()
            }
        }.background(Image("morning"))
    }
    func textStyle(txt:String) -> Text{
        let color:Color = isDay ? .black : .white
       return Text(txt)
            .font(.system(size: 24))
            .foregroundColor(color)
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(isDay: true)
    }
}
