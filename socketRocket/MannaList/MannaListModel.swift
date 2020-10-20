//
//  MannaListModel.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import RxSwift
import RxCocoa

class MannaListModel: MannaListModelProtocol {
    var currentUserInfo: BehaviorRelay<[Manna]>?
    
    init() {
        updateUserInfo()
    }
    
    static var testUser: User = User(id: "Mr.test",
                        mannaList: [
                            Manna(id: "만나단위테스트id", time: "12시", location: "사당역"),
                            Manna(id: "이거왜안되냐고",time: "1시", location: "강남역")
                        ]
    )
    
    func updateUserInfo() {
        //api 를 거친 뒤 testUser를 대체
        currentUserInfo = BehaviorRelay(value: MannaListModel.testUser.mannaList)
        currentUserInfo?.subscribe(onNext: {
            print("이거모델",$0)
        }).disposed(by: DisposeBag())
    }
}
