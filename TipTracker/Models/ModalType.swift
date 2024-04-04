//
//  ModalType.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/3/24.
//

import SwiftUI

enum ModalType: Identifiable, View {
    case new
    case update(Order)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return OrderFormView(formVM: OrderFormViewModel())
        case .update(let order):
            return OrderFormView(formVM: OrderFormViewModel(order))
        }
    }
}
