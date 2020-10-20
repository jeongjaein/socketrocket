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
    var createMannaButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        bind()
        
    }
    
    func attribute() {
        mannaList.do {
            $0.register(MannaListTableViewCell.self, forCellReuseIdentifier: MannaListTableViewCell.id)
        }
        createMannaButton.do {
            $0.backgroundColor = .orange
            $0.addTarget(self, action: #selector(createMannaAction), for: .touchUpInside)
            $0.setTitle("약속만들러 가기", for: .normal)
        }
    }
    
    func layout() {
        view.addSubview(createMannaButton)
        view.addSubview(mannaList)
        
        createMannaButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(200)
            $0.top.equalTo(70)
        }
        mannaList.snp.makeConstraints {
            $0.top.equalTo(createMannaButton.snp.bottom).offset(100)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func bind() {
        viewModel?.currentUserInfo
            .bind(to: mannaList.rx.items(cellIdentifier: MannaListTableViewCell.id, cellType: MannaListTableViewCell.self)) {(_: Int, element: Manna, cell: MannaListTableViewCell) in
            cell.title.text = element.id
        }.disposed(by: disposeBag)
    }
    
    @objc func createMannaAction() {
        let view = CreateMannaViewController()
        self.present(view, animated: true, completion: nil)
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
