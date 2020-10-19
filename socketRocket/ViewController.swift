//
//  ViewController.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import Then

class ViewController: UIViewController {
    let socketTestButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        socketTestButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        // Do any additional setup after loading the view.
    }
    
    func attribute() {
        socketTestButton.do {
            $0.backgroundColor = .cyan
            $0.setTitle("소켓", for: .normal)
        }
    }

}

