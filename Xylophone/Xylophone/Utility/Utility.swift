//
//  Utility.swift
//  Xylophone
//
//  Created by Jeanette on 3/25/25.
//

import Foundation

class Utility {
    static func toNanoseconds(seconds: Double) -> UInt64 {
        return UInt64(seconds * 1_000_000_000)
    }
}
