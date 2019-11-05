//
//  AppView.swift
//  iDine
//
//  Created by Vadim Fedoseev on 04.11.2019.
//  Copyright © 2019 Vadim Fedoseev. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
