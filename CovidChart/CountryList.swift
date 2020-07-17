//
//  CountryList.swift
//  CovidChart
//
//  Created by Alexander on 23.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CountryList: View {
  
  @ObservedObject var countryViewModel = CountryViewModel.shared
  
  var body: some View {
    NavigationView {
      List (self.countryViewModel.data.countries, id: \.id) { country in
        NavigationLink(destination: CountryDetail(country: country)) {
          CountryRow(country: country)
        }
      }
      .navigationBarTitle(Text("Covid-19"))
    }
  }
}



struct CountryList_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
      CountryList()
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
