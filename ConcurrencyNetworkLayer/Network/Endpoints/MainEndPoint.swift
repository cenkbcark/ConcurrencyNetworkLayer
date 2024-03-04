//
//  MainEndPoint.swift
//  ConcurrencyNetworkLayer
//
//  Created by Cenk Bahadır Çark on 4.03.2024.
//

import Foundation

enum MainEndPoint: Endpointable {
    case music
    case apps
    
    var baseUrl: String {
        return "https://rss.applemarketingtools.com/api/v2/us/"
    }
    
    var fullPath: String {
        return baseUrl + self.rawValue
    }
    
    var rawValue: String {
        switch self {
        case .music:
            return "music/most-played/50/albums.json"
        case .apps:
            return "apps/top-free/10/apps.json"
        }
    }
}
