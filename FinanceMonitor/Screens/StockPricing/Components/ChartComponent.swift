//
//  ChartComponent.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import SwiftUI
import Charts

struct ChartComponent: View {
    let data: [ChartModel]
    var body: some View {
            Chart(data) { d in
                // WICK (High-Low)
                RuleMark(
                    x: .value("Date", d.date),
                    yStart: .value("Low", d.low),
                    yEnd: .value("High", d.high)
                )
                .foregroundStyle(.secondary)
                
                LineMark(x: .value("Date", d.date), y: .value("Open", d.open))
                    .foregroundStyle(Color.accentColor)
                // BODY (Open-Close)
                BarMark(
                    x: .value("Date", d.date),
                    yStart: .value("Open", d.open),
                    yEnd: .value("Close", d.close)
                )
                .foregroundStyle(d.close >= d.open ? .green : .red)
                .cornerRadius(2)
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day, count: 3)) { _ in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel(format: .dateTime.day().month())
                }
            }
            .chartYAxis {
                AxisMarks(values: .automatic(desiredCount: 5)) { value in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel {
                        if let v = value.as(Double.self) {
                            Text(v, format: .number.precision(.fractionLength(2)))
                        }
                    }
                }
            }
            .chartYScale(domain: paddedDomain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
    }
    
    var minPrice: Double {
        data.map(\.low).min() ?? 0
    }

    var maxPrice: Double {
        data.map(\.high).max() ?? 0
    }

    var paddedDomain: ClosedRange<Double> {
        let padding = (maxPrice - minPrice) * 0.1
        return (minPrice - padding)...(maxPrice + padding)
    }

}

#Preview {
    ChartComponent(data: [])
}
