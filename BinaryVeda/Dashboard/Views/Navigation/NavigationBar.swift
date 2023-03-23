//
//  NavigationBar.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 21/03/23.
//

import SwiftUI


struct NavigationBar: View {
    let toolBarItems: [ToolBarItem] = [.profile, .addNew, .drawer]
    var body: some View {
        HStack {
            AppLogo()
            
            Spacer()
            
            HStack(spacing: 24) {
                ToolBar(items: toolBarItems)
            }
        }
        .frame(height: 20)
        .padding(.appMargin)
//        .background(Color.gray.opacity(0.1))
    }
    
}

struct ToolBar: View {
    @EnvironmentObject var appState: AppState

    let items: [ToolBarItem]
    func toggle(type: ToolBarItem ) {
        appState.selecteToolBarItem = type
    }
    var body: some View {
        ForEach(items, id: \.self) { toolItem in
            Button {
                toggle(type: toolItem)
            } label: {
                ToolBarItemView(item: toolItem)
            }
            .foregroundColor(.primary)
        }
    }
}

struct ToolBarItemView: View {
    let item: ToolBarItem
    var body: some View {
        Group {
            switch item {
            case .profile:
                ProfileToolBarItem()
            case .drawer:
                 DrawerToolBarItem()
            case .addNew:
                 AddNewToolBarItem()
            }
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
