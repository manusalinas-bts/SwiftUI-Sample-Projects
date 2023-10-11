//
//  VerticalBarChartView.swift
//  ChartsApp
//
//  Created by Manuel Salinas on 7/25/23.
//

import SwiftUI
import Charts

struct VerticalBarChartView: View {
    private let weekdays = Calendar.current.shortWeekdaySymbols
    private let steps = [10531, 6019, 7200, 8311, 7403, 6503, 9230]
    
    var body: some View {
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                
                // Vertical bars
                BarMark(
                    x: .value("Day", weekdays[index]),
                    y: .value("Steps", steps[index])
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

struct VerticalBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalBarChartView()
    }
}
