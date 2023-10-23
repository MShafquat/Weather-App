//
//  Double+Extensions.swift
//  Weather
//
//  Created by Shafquat Mahbub on 16/10/23.
//

import Foundation

extension Double {
    public func toString(toPlace: Int = 1) -> String {
        return String(format: "%.\(toPlace)f", self)
    }
}
