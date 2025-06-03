//
//  Util.swift
//  9thCircle
//
//  Created by Maurice Elliott on 24/05/2025.
//

func formatFloat(double: Double) -> String {
    let int = Int(double)
    let frac = Int((double - Double(int)) * 100)
    return "\(int).\(frac)"
}
