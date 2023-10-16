//
//  Double+Extensions.swift
//  Weather
//
//  Created by Shafquat Mahbub on 16/10/23.
//

import Foundation

extension Double {
    public func toString() -> String {
        return String(format: "%.1f", self)
    }
}
