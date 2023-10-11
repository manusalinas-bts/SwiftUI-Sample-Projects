//
//  MainListView.swift
//  ChartsApp
//
//  Created by Manuel Salinas on 7/25/23.
//

import SwiftUI

struct MainListView: View {

    private let chartList = ["Vertical Bars", "Horizontal Bars", "Line Chart", "Multi-Line Chart"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chartList.indices, id: \.self) { index in
                    NavigationLink(chartList[index]) {
                        
                        switch index {
                        case 0:
                            VerticalBarChartView()
                            
                        case 1:
                            HorizontalBarChartView()
                            
                        case 2:
                            LineChartView()
                            
                        case 3:
                            MultiLineChartView()
                            
                        default:
                            EmptyView()
                        }
                    }
                    .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Charts")
            .toolbarBackground(.cyan.opacity(0.1), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
