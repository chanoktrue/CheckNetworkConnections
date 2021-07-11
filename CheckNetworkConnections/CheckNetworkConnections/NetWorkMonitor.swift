//
//  NetWorkMonitor.swift
//  CheckNetworkConnections
//
//  Created by Thongchai Subsaidee on 11/7/2564 BE.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    @Published var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: queue)
    }
    
}

