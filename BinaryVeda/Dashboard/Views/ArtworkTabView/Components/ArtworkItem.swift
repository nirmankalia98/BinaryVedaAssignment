//
//  ArtworkItem.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import SwiftUI

struct ArtworkTabItem: View {
    let artworkItem: ArtowrkSection
    let isSelected: Bool
    var body: some View {
        VStack {
            Image(artworkItem.image)
                .frame(width: 32, height: 32)
            Text(artworkItem.rawValue.capitalized)
                .typography(.heading)
            
            Rectangle()
                .fill( isSelected ? .yellow : .clear)
                .frame(height: 1)
                .padding(.horizontal, 10)
        }
    }
}

struct ArtworkItem_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkTabItem(artworkItem: .exibitions, isSelected: .random())
    }
}
