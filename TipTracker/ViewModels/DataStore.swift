//
//  DataStore.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/1/24.
//

import Foundation

class DataStore: ObservableObject {
    @Published var weeks:[Week] = []
    @Published var orders:[Order] = []
    
    init() {
        loadWeeks()
    }
    
    func addWeek(_ week: Week) {
        
    }
    
    func deleteWeek() {
        
    }
    
    func loadWeeks() {
        weeks = Week.sampleData
        
        func randMoney() -> Float {
            return Float.random(in: 0.0 ..< 20.0)
        }
        
        func randOrders() -> [Order] {
            let randomMax = Int.random(in: 1...10)
            for _ in 1...randomMax {
                self.orders.append(
                    Order(number: Int.random(in: 1...100), tip: randMoney(), coins: randMoney())
                )
            }
            return self.orders
        }
        
        for _ in 1...3 {
            let week = Week(
                days: [
                    Day(weekday: "Mon", orders: randOrders()),
                    Day(weekday: "Tue", orders: randOrders()),
                    Day(weekday: "Wed", orders: randOrders()),
                    Day(weekday: "Thu", orders: randOrders()),
                    Day(weekday: "Fri", orders: randOrders()),
                    Day(weekday: "Sat", orders: randOrders()),
                    Day(weekday: "Sun", orders: randOrders())
                ]
            )
            weeks.append(week)
        }
        
    }
    
    func saveWeeks() {
        print("Saving weeks to file system eventually")
    }
    
    func addOrder(_ order: Order) {
        orders.append(order)
        print(weeks)
    }
    
    func updateOrder(_ order: Order) {
        guard let index = orders.firstIndex(where: { $0.id == order.id}) else { return }
        orders[index] = order
    }
}
