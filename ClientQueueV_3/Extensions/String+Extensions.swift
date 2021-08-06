//
//  String+Extensions.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/6/21.
//

import Foundation

extension String {
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
}
