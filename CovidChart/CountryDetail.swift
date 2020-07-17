//
//  ContentView.swift
//  CovidChart
//
//  Created by Alexander on 21.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CountryDetail: View {
    
    var country: CountryResponse
    
    @ObservedObject var vm = networkDataFetcher
    
    var body: some View {
            VStack() {

                MapView()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                
            //            CircleImage()
            //                .offset(x: 0, y: -20)
            //                .padding(.bottom, -130)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
            
                    HStack {
//                        Text(country.id)
//                            .font(.largeTitle)
                        Spacer()
                        Image(uiImage: "🇮🇹".image()!)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2) )
                            .shadow(radius: 5)
                    }
                    
                    HStack {
                        Text("Total confirmed")
                            .font(.subheadline)
                        Spacer()
                        Text("\((country.daysData.last?.confirmed) ?? 0)")
                            .font(.subheadline)
                    }

                    HStack {
                        Text("Total recovered")
                            .font(.subheadline)
                        Spacer()
                        Text("\((country.daysData.last?.recovered) ?? 0)")
                            .font(.subheadline)
                    }

                    HStack {
                        Text("Total death")
                            .font(.subheadline)
                        Spacer()
                        Text("\((country.daysData.last?.deaths) ?? 0)")
                            .font(.subheadline)
                    }

                    HStack {
                        Text("mortality")
                            .font(.subheadline)
                        Spacer()
                        Text("\(CGFloat((country.daysData.last?.deaths) ?? 0) / CGFloat((self.vm.maxRecovered + self.vm.maxDeath)) * 100)")
                            .font(.subheadline)
                    }

                      if !CountryViewModel.shared.data.countries.isEmpty {
                          ScrollView(.horizontal) {
                              HStack (alignment: .bottom, spacing: 2) {
                                ForEach(country.daysData, id: \.self) { day in
                                  HStack {
                                    Spacer()
                                  }.frame(width: 4, height: (CGFloat(day.deaths ?? 0) / CGFloat(self.deathsMax(data: self.country))) * CGFloat(200))
                                    .background(Color.red)
                                }
                              }
                          }
                      }
                }
                VStack {
                    Text("Slider")
                }
            }
                .padding(.top, -8)
                Spacer()

        }
            .navigationBarTitle(Text(country.id), displayMode: .inline)
    }
  
  func deathsMax(data: CountryResponse) -> Int {
    country.daysData.max { (day1, day2) -> Bool in
      guard let dayCurrent = day1.deaths else { return false }
      guard let dayNext = day2.deaths else { return false }
      return dayNext > dayCurrent
      }?.deaths ?? 0
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      CountryDetail(country: CountryViewModel.shared.data.countries[0])
    }
}
