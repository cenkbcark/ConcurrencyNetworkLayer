//
//  ListServiceProtocols.swift
//  ConcurrencyNetworkLayer
//
//  Created by Cenk Bahadır Çark on 4.03.2024.
//

import Foundation

protocol ListServiceable {
    func fetchSongs() async -> Result<MostPlayedSongResponse?, Error>
    func fetchApps() async -> Result<MostPlayedSongResponse?, Error>
}
