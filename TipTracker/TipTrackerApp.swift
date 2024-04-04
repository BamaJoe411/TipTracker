//
//  TipTrackerApp.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/1/24.
//

import SwiftUI

extension Float {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}

@main
struct TipTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            WeekView()
                .environmentObject(DataStore())
        }
    }
}
