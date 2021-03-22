//
//  NetworkError.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 20/03/2021.
//

import Foundation

enum NetworkError : Error {
    case domainError
    case decodingError
    case urlError
}
