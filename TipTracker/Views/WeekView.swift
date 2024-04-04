//
//  ContentView.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/1/24.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var dataStore: DataStore
    
    func weekNumberToDateRange() -> Int {
        
        let calendar = Calendar.current
        let thisWeek = calendar.component(.weekOfYear, from: .now)
        return thisWeek
    }
    var body: some View {
        NavigationStack {
            List() {
                ForEach(dataStore.weeks) { week in
                    Section {
                        ForEach(week.days) { day in
                            VStack (alignment: .leading){
                                NavigationLink(destination:
                                                DayView(day:day)
                                ) {
                                    Text(day.weekday)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Tip Weeks")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    WeekView()
        .environmentObject(DataStore())
}
