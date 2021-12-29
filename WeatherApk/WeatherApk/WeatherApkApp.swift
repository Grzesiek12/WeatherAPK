//
//  WeatherApkApp.swift
//  WeatherApk
//
//  Created by Grzegorz Wiczkowski on 28/12/2021.
//

import SwiftUI

@main
struct WeatherApp: App {
  var body: some Scene {
    WindowGroup {
      let weatherService = WeatherService()
      WeatherView(viewModel: WeatherViewModel(weatherService: weatherService))
    }
  }
}
