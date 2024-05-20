//
//  ContentView.swift
//  WeatherApp
//
//  Created by AYA on 13/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State var viewModel: ViewModelProtocol = ViewModel()
    @State var currentData:WeatherCurrent?
    @State var location:WeatherLocation?
    @State var forecastDaysList: [ForecastDay] = []
    @State var isDay:Bool = true
   
    var body: some
    View {
        let backgroundImage = isDay ? "dayBackground1" : "night"
        let color:Color = isDay ? .black : .white
        NavigationView {
                VStack{
                    Spacer()
                    VStack{
                        textStyle(txt: location?.name ?? "Unknown")
                             .fontWeight(.bold)
                        textStyle(txt: String(currentData?.temp_c ?? 0.0)+" °C")
                             .fontWeight(.bold)
                        textStyle(txt: currentData?.condition?.text ?? "")
                        textStyle(txt: "H: \(forecastDaysList.first?.day?.maxtemp_c ?? 0.0)\t L:\(forecastDaysList.first?.day?.mintemp_c ?? 0.0)")
                        Image(uiImage: Utils.getImageFromUrl(imageCode: currentData?.condition?.code ?? 0.0)!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60,height: 60)
                            .padding(.top,-20)
                            .padding(.bottom,-10)
                    }.padding(16)
                   
                    Text("3-Day forecast".uppercased())
                        .font(.subheadline)
                        .foregroundColor(color)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.clear)
                        .padding(EdgeInsets(.init(top: 24, leading: 45, bottom: -80, trailing: 16)))
                    Divider()
                        .background(color)
                        .padding(EdgeInsets(.init(top: 50, leading: 0, bottom: 0, trailing: 0)))
                    List(forecastDaysList) { weather in
                        NavigationLink(destination:DetailsView()){
                            ForecastCellView(weatherData: weather)
                                
                        }.listRowBackground(Color.clear)
                            .listRowSeparatorTint(color)
                        
                    }.scrollContentBackground(.hidden)
                        .frame(height: 180)
                    HStack{
                        VStack{
                            Text("Visiblity".uppercased())
                                .font(.system(size: 18))
                                .foregroundColor(color)
                                .padding(8)
                            textStyle(txt: String(currentData?.vis_km ?? 0.0)+" Km").fontWeight(.medium)
                        }.padding(24)
                        VStack{
                            Text("Humidity".uppercased())
                                .font(.system(size: 18))
                                .foregroundColor(color)
                                .padding(8)
                            textStyle(txt: String(currentData?.humidity ?? 0)+" %").fontWeight(.medium)
                        }.padding(24)
                    }.padding(.horizontal,24)
                    HStack{
                        VStack{
                            Text("feels like".uppercased())
                                .font(.system(size: 18))
                                .foregroundColor(color)
                                .padding(8)
                            textStyle(txt: String(currentData?.feelslike_c ?? 0.0)+" °").fontWeight(.medium)
                        }.padding(24)
                        VStack{
                            Text("pressure".uppercased())
                                .font(.system(size: 18))
                                .foregroundColor(color)
                                .padding(8)
                            textStyle(txt: String(currentData?.pressure_mb ?? 0)).fontWeight(.medium)
                        }.padding(24)
                        
                    }.padding(.horizontal,24)
                   
                }.background(Image(backgroundImage)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all))
            
        }.onAppear{
            viewModel.getDataFromNetwork()
            viewModel.notifyViewCurrentData = { current in
                print("Current Notify \(String(describing: current.temp_c))")
                self.currentData = current
            }
            viewModel.notifyViewForcastData = { forcast in
                print("ForcastData Notify \(forcast.count)")
                self.forecastDaysList = forcast
                
            }
            viewModel.notifyViewLocationData = { location in
                self.location = location
                self.isDay = Utils.isDay(fromTimestamp: location.localtime_epoch ?? 1)
            }
        }
    }
    
    func textStyle(txt:String) -> Text{
        let color:Color = isDay ? .black : .white
       return Text(txt)
            .font(.system(size: 30))
            .foregroundColor(color)
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
