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
    
    var isConnected: Bool = false

    private var queue = DispatchQueue.global()
    private var monitor = NWPathMonitor()

    func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isConnected = true
            } else {
                self.isConnected = false
            }
        }
    }
}
