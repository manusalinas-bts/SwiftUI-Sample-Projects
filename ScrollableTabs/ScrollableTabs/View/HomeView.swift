//
//  HomeView.swift
//  ScrollableTabs
//
//  Created by Manuel Salinas on 11/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab?
    @Environment(\.colorScheme) private var scheme
    @State private var tabProgress: CGFloat = 0

    var body: some View {
        VStack(spacing: 15) {
            CustomToolbar()
            CustomTabBar()

            GeometryReader {
                let size = $0.size

                // Paging view
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        SampelView(.red)
                            .id(Tab.chats)
                            .containerRelativeFrame(.horizontal)

                        SampelView(.green)
                            .id(Tab.calls)
                            .containerRelativeFrame(.horizontal)

                        SampelView(.indigo)
                            .id(Tab.settings)
                            .containerRelativeFrame(.horizontal)
                    }
                    .scrollTargetLayout()
                    .offsetX { val in
                        // converting offset into progress
                        let progress = -val / (size.width * CGFloat(Tab.allCases.count - 1))
                        tabProgress = max(min(progress, 1), 0)
                    }
                }
                .scrollPosition(id: $selectedTab)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .scrollClipDisabled()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.gray.opacity(0.1))
    }

    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                HStack(spacing: 10) {
                    Image(systemName: tab.systemImage)

                    Text(tab.rawValue)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    /// Updating tab
                    withAnimation(.snappy) {
                        selectedTab = tab
                    }
                }

            }
        }
        .tabMask(tabProgress)

        /// Scrollable active tab indictor
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(Tab.allCases.count)
                Capsule()
                    .fill(scheme == .dark ? .black : .white)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        }
        .background(.gray.opacity(0.1), in: .capsule)
        .padding(.horizontal, 15)
    }

    @ViewBuilder
    func SampelView(_ color: Color) -> some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                ForEach(1...10, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color.gradient)
                        .frame(height: 150)

                }
            })
            .padding(15)
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
        .mask {
            Rectangle()
                .padding(.bottom, -100)
        }
    }
}

#Preview {
    HomeView()
}
