//
//  ContentView.swift
//  CheckNetworkConnections
//
//  Created by Thongchai Subsaidee on 11/7/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var monitor = NetworkMonitor()
    @State private var isShowAlert = false
    
    var body: some View {
        
        VStack {
            Image(systemName: monitor.isConnected ? "wifi" : "wifi.slash")
                .font(.system(size: 60))
            Text(monitor.isConnected ? "Connected!" : "Not connected!" )
                .padding()
            
            Button("Perform network request") {
                self.isShowAlert.toggle()
            }
        }
        .alert(isPresented: $isShowAlert, content: {
            if monitor.isConnected {
                return Alert(
                    title: Text("Succes!"),
                    message: Text("The network requet can be ferformed."),
                    dismissButton: .default(Text("OK")))
            }
            return Alert(title: Text("No Internet Connection"),
                         message: Text("Pleae enable WiFi or Cellura data."),
                         dismissButton: .default(Text("Cancel")))
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
