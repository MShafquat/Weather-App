//
//  Date+Extensions.swift
//  Weather
//
//  Created by Shafquat Mahbub on 23/10/23.
//

import Foundation

extension Date {
    public func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh':'mm' 'aa'"
        return dateFormatter.string(from: self)
    }

    public func getShortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd' 'MMM'"
        return dateFormatter.string(from: self)
    }
}
