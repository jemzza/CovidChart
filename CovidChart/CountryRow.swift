//
//  CoutryRow.swift
//  CovidChart
//
//  Created by Alexander on 23.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CountryRow: View {
  
  var country: CountryResponse
  
  var body: some View {
    HStack(spacing: 10) {
      Image(uiImage: "🏳️".image()!)
        .resizable()
        .frame(width: 50, height: 50)
        .cornerRadius(50)
      VStack (alignment: .leading, spacing: 8) {
        Text(country.id)
          .fontWeight(.heavy)
        HStack (spacing: 10) {
          Text("\(deathsMax(data: country))")
            .foregroundColor(.red)
          Text("\(confirmedMax(data: country))")
            .foregroundColor(.yellow)
          Text("\(recoveredMax(data: country))")
            .foregroundColor(.green)
        }
      }
    }
  }
  
  func deathsMax(data: CountryResponse) -> Int {
    country.daysData.max { (day1, day2) -> Bool in
      guard let dayCurrent = day1.deaths else { return false }
      guard let dayNext = day2.deaths else { return false }
      return dayNext > dayCurrent
      }?.deaths ?? 0
  }

  func confirmedMax(data: CountryResponse) -> Int {
    country.daysData.max { (day1, day2) -> Bool in
      guard let dayCurrent = day1.confirmed else { return false }
      guard let dayNext = day2.confirmed else { return false }
      return dayNext > dayCurrent
      }?.confirmed ?? 0
  }
  
  func recoveredMax(data: CountryResponse) -> Int {
    country.daysData.max { (day1, day2) -> Bool in
      guard let dayCurrent = day1.recovered else { return false }
      guard let dayNext = day2.recovered else { return false }
      return dayNext > dayCurrent
      }?.recovered ?? 0
  }
  
}

struct CoutryRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CountryRow(country: CountryViewModel.shared.data.countries[0])
      CountryRow(country: CountryViewModel.shared.data.countries[1])
    }
    .previewLayout(.fixed(width: 300, height: 70))
  }
}
