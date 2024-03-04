//
//  ListNetworkable.swift
//  ConcurrencyNetworkLayer
//
//  Created by Cenk Bahadır Çark on 4.03.2024.
//

import Foundation

struct ListService: Networkable, ListServiceable {
    
    func fetchSongs() async -> Result<MostPlayedSongResponse?, Error> {
        return await fetchData(endPoint: MainEndPoint.music, model: MostPlayedSongResponse.self)
    }
    
    func fetchApps() async -> Result<MostPlayedSongResponse?, Error> {
        return await fetchData(endPoint: MainEndPoint.apps, model: MostPlayedSongResponse.self)
    }
}

