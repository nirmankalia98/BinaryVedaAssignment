//
//  ArtworkTab.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

enum ArtowrkSection: String {
    case uploads
    case exibitions
    case revenue
    
    var image: String {
        switch self {
        case .uploads:
            return "uploadIcon"
        case .exibitions:
            return "exhibition"
        case .revenue:
            return "revenue"
        }
    }
}

struct ArtworkTab: View {
    
    @StateObject var viewModel: ArtworkViewModel
    
    let gridItems: [GridItem] = [
        GridItem(.flexible(), alignment: .center),
        GridItem(.flexible(), alignment: .center)
    ]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.sections, id: \.self) { item in
                    ArtworkTabItem(artworkItem: item, isSelected: item == viewModel.selectedSection)
                        .frame(width: (UIScreen.main.bounds.width - .appMargin*2)/3 )
                    .onTapGesture {
                        viewModel.selectedSection = item
                    }
                }
            }
            VStack {
                LazyVGrid(columns: gridItems, spacing: 6) {
                    ForEach(viewModel.filteredAlbums, id: \.id) { album in
                        WebImage(url: URL(string: album.thumbnailUrl))
                            .resizable()
                            .aspectRatio(1 ,contentMode: .fit)
                            .background(
                                ZStack {
                                    Color.gray
                                    Image(systemName: "clock")
                                }
                            )
                            .onAppear {
                                viewModel.loadMoreIfNeeded(currentItem: album)
                            }
                        
                    }
                }
                if viewModel.isLoading {
                    ActivityIndicator($viewModel.isLoading)
                        .padding(.vertical, 20)
                }
            }
        }
        .padding(.horizontal, .appMargin)
        .padding(.bottom, .appMargin)
    }
}

// Components

struct ArtworkTab_Previews: PreviewProvider {
    static let vm = ArtworkViewModel(artowrkDataService: MockArtworkService())
    static var previews: some View {
        ArtworkTab(viewModel: vm)
    }
}
