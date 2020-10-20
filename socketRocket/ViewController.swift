//
//  ViewController.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import Then
import TAKUUID

class ViewController: UIViewController {
    let socketTestButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        var uuid = TAKUUIDStorage.sharedInstance().findOrCreate()
        print(uuid)
    }
    
    func attribute() {
        socketTestButton.do {
            $0.backgroundColor = .cyan
            $0.setTitle("소켓", for: .normal)
            $0.addTarget(self, action: #selector(goToSocketRocket), for: .touchUpInside)
        }
    }
    
    func layout() {
        view.addSubview(socketTestButton)
        
        socketTestButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @objc func goToSocketRocket() {
        let view = MannaListView()
        let viewModel = MannaListViewModel()
        let model = MannaListModel()
        
        view.viewModel = viewModel
        viewModel.model = model
        
        view.modalPresentationStyle = .fullScreen
        self.present(view, animated: false, completion: nil)
    }

}

