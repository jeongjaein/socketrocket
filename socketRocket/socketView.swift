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
        connectButton.do {
            $0.backgroundColor = .systemPink
            $0.setTitle("연결", for: .normal)
        }
        disconnectButton.do {
            $0.backgroundColor = .cyan
            $0.setTitle("끊기", for: .normal)
        }
        textField.do {
            $0.placeholder = "할얘기 있으면 하세요"
            $0.backgroundColor = .white
            $0.tintColor = .black
        }
        emitButton.do {
            $0.backgroundColor = .orange
            $0.setTitle("방출", for: .normal)
        }
        backbutton.do {
            $0.backgroundColor = .gray
            $0.setTitle("뒤로가기", for: .normal)
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
    
}
