//
//  OrderFormViewModel.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/2/24.
//

import Foundation

class OrderFormViewModel: ObservableObject {
    @Published var number: Int = 0
    @Published var tip: Float = 0.0
    @Published var coins: Float = 0.0
    var id: String?
    
    var updating: Bool {
        id != nil
    }
    
    var isDisabled: Bool {
        number == 0
    }
    
    init() {}
    
    init(_ currentOrder: Order) {
        self.number = currentOrder.number
        self.tip = currentOrder.tip
        self.coins = currentOrder.coins
    }
}
