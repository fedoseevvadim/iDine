//
//  OrderView.swift
//  iDine
//
//  Created by Vadim Fedoseev on 04.11.2019.
//  Copyright © 2019 Vadim Fedoseev. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach( order.items ) { item in
                        HStack {
                            Text (item.name)
                            Spacer()
                            Text ("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination:
                    CheckoutView()) {
                        Text ("Place Order")
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems (at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
