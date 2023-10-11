//
//  HorizontalBarChartView.swift
//  ChartsApp
//
//  Created by Manuel Salinas on 7/25/23.
//

import SwiftUI
import Charts

struct HorizontalBarChartView: View {
    
    private let weekdays = Calendar.current.shortWeekdaySymbols
    private let steps = [10531, 6019, 7200, 8311, 7403, 6503, 9230]
    
    var body: some View {
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                // Horizontal bars
                BarMark(
                    x: .value("Steps", steps[index]),
                    y: .value("Days", weekdays[index])
                )
                .foregroundStyle(by: .value("Day", weekdays[index]))
                .annotation {
                    Text("\(steps[index])")
                }
            }
        }
        .padding()
    }
}

struct HorizontalBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalBarChartView()
    }
}
