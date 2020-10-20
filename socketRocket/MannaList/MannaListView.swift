//
//  MannaListView.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class MannaListView: UIViewController {
    var mannaList = UITableView()
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        print(user)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func attribute() {
        mannaList.do {
            $0.backgroundColor = .cyan
        }
    }
    
    func layout() {
        view.addSubview(mannaList)
        
        mannaList.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
