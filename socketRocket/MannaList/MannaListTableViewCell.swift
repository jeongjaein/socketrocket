//
//  MannaListTableViewCell.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit

class MannaListTableViewCell: UITableViewCell {
    static let id = "MAnnaListTableViewCell"
    
    var title = UILabel()
        
    init() {
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        title.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }

}
