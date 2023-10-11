//
//  MultiLineChartView.swift
//  ChartsApp
//
//  Created by Manuel Salinas on 7/25/23.
//

import SwiftUI
import Charts

struct MultiLineChartView: View {
    private let chartData = [
        (city: "Japan", data: japanWeatherData),
        (city: "London", data: londonWeatherData),
        (city: "Mexico", data: mexicoWeatherData)
    ]
    
    var body: some View {
        Chart {
            ForEach(chartData, id: \.city) { series in
                ForEach(series.data) { item in
                    LineMark(
                        x: .value("Month", item.date),
                        y: .value("Temp", item.temperature)
                    )
                    .interpolationMethod(.monotone)
                }
                .foregroundStyle(by: .value("City", series.city))
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
                .background(.gray.opacity(0.02))
        }
    }
}

struct MultiLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineChartView()
    }
}
