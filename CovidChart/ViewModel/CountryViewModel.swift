//
//  CountryViewModel.swift
//  CovidChart
//
//  Created by Alexander on 27.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI
import Network

class CountryViewModel: ObservableObject {
  
  @Published var data: CountryListResponse = load("data.json")
  
  static let shared = CountryViewModel()
  private init() {}
    
//  monitor.pathUpdateHandler = { path in
//      if path.status == .satisfied {
//          print("We're connected!")
//      } else {
//          print("No connection.")
//      }
//
//      print(path.isExpensive)
//  }
  
}

