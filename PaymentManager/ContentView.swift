//
//  ContentView.swift
//  PaymentManager
//
//  Created by Georgius Yoga on 7/2/25.
//

import SwiftUI

struct ContentView: View {
    
    // View Properties
    @State private var searchText: String = ""
    @State private var isSearchActive: Bool = false
    @State private var activeTab: TabModel = .primary
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                CustomTabBar(activeTab: $activeTab)
            }
            .navigationTitle("Employee Payroll")
            .searchable(
                text: $searchText,
                isPresented: $isSearchActive,
                placement: .navigationBarDrawer(displayMode: .automatic))
            .background(.regularMaterial)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // todo
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct CustomTabBar: View {
    @Binding var activeTab: TabModel
    var body: some View {
        GeometryReader { _ in
            HStack(spacing: 8) {
                HStack(spacing: 8) {
                    ForEach(TabModel.allCases.filter({ $0 != .allMails }), id: \.rawValue) { tab in
                        ResizeableTabButton(tab)
                    }
                }
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 50)
    }

    @ViewBuilder
    func ResizeableTabButton(_ tab: TabModel) -> some View {
        HStack(spacing: 8) {
            Image(systemName: tab.symbolImage)
                .symbolVariant(activeTab == tab ? .fill : .none)
            
            if activeTab == tab {
                Text(tab.rawValue)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .lineLimit(1)
            }
        }
        .foregroundStyle(activeTab == tab ? .white : .gray)
        .frame(maxHeight: .infinity)
        .frame(maxWidth: activeTab == tab ? .infinity : nil)
        .padding(.horizontal, 20)
        .background {
            Rectangle()
                .fill(activeTab == tab ? tab.color : .gray.opacity(0.1))
        }
        .clipShape(.rect(cornerRadius: 20, style: .continuous))
        .contentShape(.rect)
        .onTapGesture {
            withAnimation(.linear(duration: 0.2)) {
                activeTab = tab
            }
        }
    }
}

#Preview {
    ContentView()
}
