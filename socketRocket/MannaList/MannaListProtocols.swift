//
//  MannaListProtocols.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import RxSwift
import RxCocoa

protocol MannaListViewProtocol {
    var viewModel: MannaListViewModelProtocol? { get set }
    
    func didCreateButtonClicked()
    func reloadData()
}

protocol MannaListViewModelProtocol {
    var disposeBag: DisposeBag { get set }
    var currentUserInfo: BehaviorRelay<[Manna]> { get set }
    var model: MannaListModelProtocol? { get set }
}

protocol MannaListModelProtocol {
    var currentUserInfo: BehaviorRelay<[Manna]>? { get set }
    
    //VIEWMODEL -> MODEL
    func updateUserInfo()
}
