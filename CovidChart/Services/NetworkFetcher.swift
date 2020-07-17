//
//  NetworkFetcher.swift
//  CovidChart
//
//  Created by Alexander on 22.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

var networkDataFetcher = NetworkFetcher()
var dataNetwork = networkDataFetcher.dataSet

class NetworkFetcher: ObservableObject {
    
    @Published var dataSet = [CountryResponse]()
//    @Published var dataSetCase = [DayDataResponse]()
    var maxDeath = 0
    var maxConfirmed = 0
    var maxRecovered = 0
    
    init() {
        let urlString = "https://pomber.github.io/covid19/timeseries.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // i wont be checking errors but you should
            guard let data = data else { return }
            do {
                let timesSeries = try JSONDecoder().decode(CountryListResponse.self, from: data)
                DispatchQueue.main.async {
                    self.dataSet = timesSeries.countries
                    
                    /*
                    self.dataSetCase = self.dataSet[30].daysData.filter { $0.deaths > 0 }
                        self.maxDeath = self.dataSetCase.max(by: { (day1 , day2) -> Bool in
                            return day2.deaths > day1.deaths
                            })?.deaths ?? 0

                        self.maxConfirmed = self.dataSetCase.max(by: { (day1 , day2) -> Bool in
                        return day2.confirmed > day1.confirmed
                        })?.confirmed ?? 0

                        self.maxRecovered = self.dataSetCase.max(by: { (day1 , day2) -> Bool in
                        return day2.recovered > day1.recovered
                        })?.recovered ?? 0
                    */
                }
            } catch {
                print("JSON Decode failed:", error)
            }
        }.resume()
    }
}
