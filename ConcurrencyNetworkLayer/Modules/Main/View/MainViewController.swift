//
//  MainViewController.swift
//  ConcurrencyNetworkLayer
//
//  Created by Cenk Bahadır Çark on 4.03.2024.
//

import UIKit

final class MainViewController: UIViewController {

    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchSongs()
    }
}
