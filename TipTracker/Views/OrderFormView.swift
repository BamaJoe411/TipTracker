//
//  OrderFormView.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/2/24.
//

import SwiftUI

struct OrderFormView: View {
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var formVM: OrderFormViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Order Number")
                        TextField(
                            "", value: $formVM.number,
                            formatter: NumberFormatter()
                        )
                    }
                    HStack {
                        Text("Tip")
                        TextField(
                            "", value: $formVM.tip,
                            formatter: NumberFormatter()
                        )
                    }
                    HStack {
                        Text("Coins")
                        TextField(
                            "", value: $formVM.coins,
                            formatter: NumberFormatter()
                        )
                    }
                }
            }
            .navigationTitle("New Order")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updateSaveButton)
        }
    }
}

extension OrderFormView {
    func updateOrder() {
        let order = Order(id: formVM.id!, number: formVM.number, tip: formVM.tip, coins: formVM.coins)
        dataStore.updateOrder(order)
        presentationMode.wrappedValue.dismiss()
    }
    
    func addOrder() {
        let order = Order(number: formVM.number, tip: formVM.tip, coins: formVM.coins)
        dataStore.addOrder(order)
        print()
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button( formVM.updating ? "Update" : "Save",
                action: formVM.updating ? updateOrder : addOrder
        )
        .disabled(formVM.isDisabled)
    }
}
#Preview {
    OrderFormView(formVM: OrderFormViewModel())
        .environmentObject(DataStore())
}
