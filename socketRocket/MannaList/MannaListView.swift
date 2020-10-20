//
//  MannaListView.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import RxCocoa
import RxSwift

class MannaListView: UIViewController {
    var MannaList = UITableView()
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        print(user)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MannaList.
    }
}
