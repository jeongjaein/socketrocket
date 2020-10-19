//
//  socketVIew.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import SocketIO

class socketView: UIViewController {
    
    var manager = SocketIOManager()
    
    var connectButton = UIButton()
    var disconnectButton = UIButton()
    var textField = UITextField()
    var emitButton = UIButton()
    var backbutton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func attribute() {
        view.do {
            $0.backgroundColor = .black
        }
        connectButton.do {
            $0.backgroundColor = .systemPink
            $0.setTitle("연결", for: .normal)
            $0.addTarget(self, action: #selector(didConnectButtonClicked), for: .touchUpInside)
        }
        disconnectButton.do {
            $0.backgroundColor = .cyan
            $0.setTitle("끊기", for: .normal)
            $0.addTarget(self, action: #selector(didDisConnectButtonClicked), for: .touchUpInside)
        }
        textField.do {
            $0.placeholder = "할얘기 있으면 하세요"
            $0.backgroundColor = .white
            $0.tintColor = .black
        }
        emitButton.do {
            $0.backgroundColor = .orange
            $0.setTitle("방출", for: .normal)
            $0.addTarget(self, action: #selector(didEmitButtonClicked), for: .touchUpInside)
        }
        backbutton.do {
            $0.backgroundColor = .gray
            $0.setTitle("뒤로가기", for: .normal)
            $0.addTarget(self, action: #selector(didBackButtonClicked), for: .touchUpInside)
        }
    }
    
    func layout() {
        view.addSubview(connectButton)
        view.addSubview(disconnectButton)
        view.addSubview(textField)
        view.addSubview(emitButton)
        view.addSubview(backbutton)
        
        connectButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        disconnectButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: connectButton.bottomAnchor, constant: 50).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        textField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: disconnectButton.bottomAnchor, constant: 50).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        emitButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        backbutton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    @objc func didConnectButtonClicked() {
        print("c")
    }
    @objc func didDisConnectButtonClicked() {
        print("d")
    }
    @objc func didEmitButtonClicked() {
        print("e")
    }
    @objc func didBackButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}
