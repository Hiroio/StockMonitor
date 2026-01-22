//
//  LoadingComponent.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import SwiftUI

struct LoadingComponent: View {
    @State private var isLoading: Bool = false
    var body: some View {
        VStack{
            Spacer()
            HStack{
                let size = CGSize(width: isLoading ? 7 : 50, height: isLoading ? 75 : 50)
                Rectangle()
                    .frame(width: size.width, height: size.height)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(.easeInOut(duration: 1.3).repeatForever(), value: isLoading)
            }
            Spacer()
        }

        .onAppear{
            isLoading = true
        }
    }
}

#Preview {
    LoadingComponent()
}
