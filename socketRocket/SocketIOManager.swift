//
//  SocketIOManager.swift
//  socketRocket
//
//  Created by 정재인 on 2020/10/20.
//

import UIKit
import Starscream

class SocketIOManager: WebSocketDelegate {
    static let shared = SocketIOManager()
    
    var webSocket: WebSocket?
    
    func websocketDidConnect(socket: WebSocketClient) {
        let url = "wss://echo.websocket.org"
        
        var request = URLRequest(url: URL(string: url)!)
        request.timeoutInterval = 10
        //                    webSocket = WebSocket(request: request, certPinner: FoundationSecurity(allowSelfSigned: true))
        webSocket = WebSocket(request: request)
        webSocket?.delegate = self
        webSocket?.connect()
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        webSocket?.disconnect()
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("r")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("d")
    }
    
    //    static let shared = SocketIOManager()
    //
    //    var manager = SocketManager(socketURL: URL(string: "wss://echo.websocket.org")!, config: [.log(true), .compress])
    //    var socket: SocketIOClient!
    //
    //    override init() {
    //        super.init()
    //        socket = self.manager.defaultSocket
    //        socket.on("test") { dataArray, ack in
    //            print(dataArray)
    //        }
    //    }
    //    func establishConnection() {
    //        socket.connect()
    //    }
    //    func closeConnection() {
    //        socket.disconnect()
    //    }
    //    func sendMessage(message: String) {
    ////        socket.emit("event", ["message" : "This is a test message"])
    ////        socket.emit("event1", [["name" : "ns"], ["email" : "@naver.com"]])
    ////        socket.emit("event2", ["name" : "ns", "email" : "@naver.com"])
    //        socket.emit("test", ["되라좀"])
    //
    //    }
}
