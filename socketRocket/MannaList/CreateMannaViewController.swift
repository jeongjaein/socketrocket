//
//  CreateMannaViewController.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class CreateMannaViewController: UIViewController {
    var textField = UITextField()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        attribute()
        layout()
        bind()
    }
    
    func attribute() {
        view.do {
            $0.backgroundColor = .black
        }
        textField.do {
            $0.backgroundColor = .white
            $0.textColor = .black
            $0.attributedPlaceholder = NSAttributedString(string: "약속 제목을 입력하세욧", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            $0.textAlignment = .center
        }
    }
    
    func layout() {
        view.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(70)
            $0.top.centerX.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func bind() {
        textField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: {
            self.view.endEditing(true)
            self.dismiss(animated: true, completion: nil)
            self.postManna()
        }).disposed(by: disposeBag)
    }
    
    func postManna() {
        var param = Parameters()
        if let uuid = AppDelegate.UUID {
            param = [
                "device_id" : uuid,
                "manna_name" : textField.text
            ]
        }
        
        let result = AF.request("http://ec2-13-124-151-24.ap-northeast-2.compute.amazonaws.com:8888/manna", method: .post, parameters: param, encoding: JSONEncoding.default)
        
        result.responseJSON() { response in
                print("JSON = \(try! response.result.get())")
            if let jsonObject = try! response.result.get()  as? [String: Any] {
                
                print("타임스탬프 : \(jsonObject["create_timestamp"]!)")
                print("만나네임 : \(jsonObject["manna_name"]!)")
                print("uuid : \(jsonObject["uuid"]!)")
            }
        }
    }
}

