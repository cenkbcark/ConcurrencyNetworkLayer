//
//  MainViewModel.swift
//  ConcurrencyNetworkLayer
//
//  Created by Cenk Bahadır Çark on 4.03.2024.
//

import Foundation

final class MainViewModel: MainViewModelProtocol {
    
    var songs: [MusicModel]? = []
    var apps: [MusicModel]? = []
    
    var service: ListService
    
    init(service: ListService) {
        self.service = service
    }
    
    func fetchSongs() {
        Task(priority: .background) {
            let result = await service.fetchSongs()
            switch result {
            case .success(let result):
                self.songs = result?.feed.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchApps() {
        Task(priority: .background) {
            let result = await service.fetchApps()
            switch result {
            case .success(let result):
                self.apps = result?.feed.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
