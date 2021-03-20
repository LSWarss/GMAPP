//
//  Logger.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 20/03/2021.
//

import Foundation

class Logger {
    static let shared = Logger()
    
    private init() {}
    
    func error(_ message: String) {
        print("❌: \(message)")
    }
    
    func log(_ message: String) {
        print("✅: \(message)")
    }
}
