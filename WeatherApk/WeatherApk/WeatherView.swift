//
//  WeatherView.swift
//  WeatherApk
//
//  Created by Grzegorz Wiczkowski on 28/12/2021.
//

import SwiftUI

struct WeatherView: View {

  @ObservedObject var viewModel: WeatherViewModel

  var body: some View {
      ZStack {
      LinearGradient(gradient: Gradient(colors: [
          Color.blue,
          Color.green,
          Color.yellow,
          Color.pink,
          Color.blue
      ]),
                     startPoint: .topLeading,
                     endPoint: .bottomLeading)
      .ignoresSafeArea(.all, edges: .all)
      
    VStack {
        
      Text(viewModel.cityName)
        .font(.largeTitle)
        .padding()
      Text(viewModel.temperature)
        .font(.system(size: 70))
        .bold()
      Text(viewModel.weatherIcon)
        .font(.largeTitle)
        .padding()
      Text(viewModel.weatherDescription)
       
    }
      }
    .alert(isPresented: $viewModel.shouldShowLocationError) {
      Alert(
        title: Text("Error"),
        message: Text("To see the weather, provide location access in Settings."),
        dismissButton: .default(Text("Open Settings")) {
          guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
          UIApplication.shared.open(settingsURL)
        }
      )
    }
    .onAppear(perform: viewModel.refresh)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
  }
}

