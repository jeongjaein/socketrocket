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
    let disposeBag = DisposeBag()
    var mannaList = UITableView()
    
    var viewModel: MannaListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        bind()
    }
    
    func attribute() {
        mannaList.do {
            $0.backgroundColor = .cyan
            $0.register(MannaListTableViewCell.self, forCellReuseIdentifier: MannaListTableViewCell.id)
        }
    }
    
    func layout() {
        view.addSubview(mannaList)
        
        mannaList.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func bind() {
        viewModel?.currentUserInfo
            .bind(to: mannaList.rx.items(cellIdentifier: MannaListTableViewCell.id, cellType: MannaListTableViewCell.self)) {(_: Int, element: Manna, cell: MannaListTableViewCell) in
            cell.title.text = element.id
        }.disposed(by: disposeBag)
    }
}

extension MannaListView: MannaListViewProtocol {
    
    
    func didCreateButtonClicked() {
        print("click")
    }
    
    func reloadData() {
        print("reload")
    }
    
    
}
