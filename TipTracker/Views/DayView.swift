//
//  DayView.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/2/24.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var dataStore: DataStore
    var day: Day
    
    @State private var modalType: ModalType? = nil
    
    func weekNumberToDateRange() -> Int {
        
        let calendar = Calendar.current
        let thisWeek = calendar.component(.weekOfYear, from: .now)
        return thisWeek
    }
    var body: some View {
        NavigationView {
            ZStack {
                List() {
                    ForEach(day.orders) { order in
                        VStack (alignment: .leading){
                            HStack {
                                Text("Order#: \(order.number)")
                                Spacer()
                                Text("Tip: \(order.tip)")
                                    .font(.title3)
                                    .foregroundColor(Color(.blue))
                                Spacer()
                                Text("Coins: \(order.coins)")
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(day.weekday)
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            modalType = .new
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
            }
        }
        .sheet(item: $modalType) { $0 }
    }
}

//#Preview {
//    DayView(day: )
//        .environmentObject(DataStore())
//}
