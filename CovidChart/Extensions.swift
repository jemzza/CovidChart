//
//  Extensions.swift
//  CovidChart
//
//  Created by Alexander on 22.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 50, height: 50)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.init(red: 233 / 255, green: 232 / 255, blue: 234 / 255, alpha: 1).set()
//        UIColor.white.set()
        let rect = CGRect(origin: .init(x: 4, y: 3), size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 38)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
