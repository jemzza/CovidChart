//
//  CircleImage.swift
//  CovidChart
//
//  Created by Alexander on 22.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image(uiImage: "🇮🇹".image()!)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2) )
        .shadow(radius: 5)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
