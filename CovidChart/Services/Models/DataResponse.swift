//
//  Model.swift
//  CovidChart
//
//  Created by Alexander on 21.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import Foundation

struct CountryListResponse: Decodable {
  
  var countries: [CountryResponse]
  
  init(from decoder: Decoder) throws {
    self.countries = try decoder.singleValueContainer()
      .decode([String: [DayDataResponse]].self)
      .map(CountryResponse.init)
  }
}

struct CountryResponse: Decodable, Hashable, Identifiable {
  let id: String
  let daysData: [DayDataResponse]
}

struct DayDataResponse: Decodable, Hashable {
  let date: String
  let confirmed: Int?
  let deaths: Int?
  let recovered: Int?
}

