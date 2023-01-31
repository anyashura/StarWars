//
//  NetworkMonitor.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 30.01.2023.
//

import Foundation
import Network

final class NetworkMonitor {
    static var shared = NetworkMonitor()
    public var isConnected: Bool = false

    private var queue = DispatchQueue.global()
    private var monitor = NWPathMonitor()

    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isConnected = true
//                print("Internet is Ok")
            } else {
                self.isConnected = false
//                print("No connection.")
            }
        }
    }
}
