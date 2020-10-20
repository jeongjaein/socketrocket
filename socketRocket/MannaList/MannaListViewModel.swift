//
//  MannaListViewModel.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import RxSwift
import RxCocoa

class MannaListViewModel: MannaListViewModelProtocol {
    
    var disposeBag = DisposeBag()
    var currentUserInfo = BehaviorRelay(value: [Manna(id: "만나단위테스트id", time: "12시", location: "사당역"), Manna(id: "이거왜안되냐고",time: "1시", location: "강남역")])
    var model: MannaListModelProtocol?
    
    init() {
    }
}
