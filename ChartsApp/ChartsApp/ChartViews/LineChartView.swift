//
//  LineChartView.swift
//  ChartsApp
//
//  Created by Manuel Salinas on 7/25/23.
//

import SwiftUI
import Charts

struct LineChartView: View {
    var body: some View {
        Chart {
            ForEach(mexicoWeatherData) { item in
                LineMark(
                    x: .value("Month", item.date),
                    y: .value("Temp", item.temperature)
                )
                .annotation {
                    Text("\(item.temperature.formatted(.number))")
                        .fontWeight(.bold)
                        .background(.blue)
                        .foregroundStyle(.white)
                }
            }
        }
        .padding()
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.abbreviated))
                }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartPlotStyle { plotArea in
            plotArea
                .background(.green.opacity(0.03))
        }
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
