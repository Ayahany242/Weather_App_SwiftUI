//
//  DetailsView.swift
//  WeatherApp
//
//  Created by AYA on 14/05/2024.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    var tempHourlyList : [HourlyForecast]
    var isDay:Bool
    var dayOfWeek:String
    var body: some View {
        let backgroundImage = isDay ? "dayBackground1" : "night"
        let icon = isDay ? "back_icon_dark" : "back_icon_white"
        let color:Color = isDay ? .black : .white
        ZStack {
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Image(icon)
                        .resizable()
                        .frame(width: 40,height: 40)
                        .padding(.leading,24)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    textStyle(txt: Utils.dayOfWeek(fromTimestamp:  dayOfWeek) ?? "unknown")
                        .padding(.leading,-35)
                    Spacer()
                }.frame(height: 30)
                
                let filteredHourlyList = tempHourlyList.filter { hourlyForecast in
                    let currentHour = Calendar.current.component(.hour, from: Date())
                            if let timeString = hourlyForecast.time,
                               let hour = Int(timeString.components(separatedBy: " ").last?.components(separatedBy: ":").first ?? "0") {
                                return hour >= currentHour
                            }
                            return false
                        }
                List(filteredHourlyList,id: \.time) { temp in
                               HStack {
                                   textStyle(txt: Utils.extractTime(from: temp.time!) ?? "")
                                   Spacer()
                                   Image(uiImage: Utils.getImageFromUrl(imageCode: temp.condition?.code ?? 0.0)!)
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 40, height: 40)
                                       .padding()
                                   Spacer()
                                   textStyle(txt: "\(String(temp.temp_c ?? 0.0))°")
                               }
                               .frame(height: 40)
                               .padding(8)
                               .listRowBackground(Color.clear)
                               .listRowSeparatorTint(color)
                           }.scrollContentBackground(.hidden)
            }
            
        }.navigationBarHidden(true)
    }
    func textStyle(txt:String) -> Text{
        let color:Color = isDay ? .black : .white
        print("tempHourlyList \(tempHourlyList.count)")
       return Text(txt)
            .font(.system(size: 24))
            .foregroundColor(color)
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(tempHourlyList: [], isDay: true,dayOfWeek: "")
    }
}
