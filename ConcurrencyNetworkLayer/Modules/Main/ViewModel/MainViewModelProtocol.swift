//
//  MainViewModelProtocol.swift
//  ConcurrencyNetworkLayer
//
//  Created by Cenk Bahadır Çark on 4.03.2024.
//

import Foundation

protocol MainViewModelProtocol {
    var service: ListService { get set }
    var songs: [MusicModel]? { get set }
    var apps: [MusicModel]? { get set }
    
    func fetchSongs()
    func fetchApps()
}
