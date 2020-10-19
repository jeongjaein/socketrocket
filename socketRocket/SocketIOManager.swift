//
//  SocketIOManager.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    
    var manager = SocketManager(socketURL: URL(string: "ec2-13-124-151-24.ap-northeast-2.compute.amazonaws.com:9999")!, config: [.log(true), .compress])
    var socket: SocketIOClient!
    
    override init() {
        super.init()
//        socket = self.manager.socket(forNamespace: "/")
        socket = self.manager.defaultSocket
        socket.on("test") {
            dataArray, ack in print(dataArray)
        }
    }
    func establishConnection() {
        socket.connect()
    }
    func closeConnection() {
        socket.disconnect()
    }
    func sendMessage(message: String, nickname: String) {
        socket.emit("event", ["message" : "This is a test message"])
        socket.emit("event1", [["name" : "ns"], ["email" : "@naver.com"]])
        socket.emit("event2", ["name" : "ns", "email" : "@naver.com"])
        socket.emit("msg", ["nick": nickname, "msg" : message]) }
}
