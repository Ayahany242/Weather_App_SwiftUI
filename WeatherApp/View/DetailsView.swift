//
//  DetailsView.swift
//  WeatherApp
//
//  Created by AYA on 14/05/2024.
//

import SwiftUI

struct DetailsView: View {
    var tempHourlyList : [HourlyForecast] = []
    var body: some View {
        ScrollView{
            List(tempHourlyList){ temp in
                HStack{
                    Text("temp.time_epoch")
                    Image("cloud")
                        .frame(width:40,height: 40).padding()
                    Text("temp.temp_c")
                }.padding()
            }
        }.background(Image("morning"))
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
