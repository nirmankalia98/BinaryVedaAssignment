//
//  ArtworkViewModel.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation
import Combine
class ArtworkViewModel: ObservableObject {
    
    let sections: [ArtowrkSection] = [.uploads, .exibitions, .revenue]
    @Published var selectedSection: ArtowrkSection = .uploads
    
    let artowrkDataService: ArtworkDataServiceProtocol
    @Published var filteredAlbums: [AlbumEntity] = []
    @Published private var allAlbums: [AlbumEntity] = []
    var pageNumber = 1
    let limit = 10
    var canLoadMorePages = true
    @Published var isLoading = true
    var cancellabel = Set<AnyCancellable>()
    
    public init(artowrkDataService: ArtworkDataServiceProtocol) {
        self.artowrkDataService = artowrkDataService
        fetchData()
        setObservers()
    }
    
    func loadMoreIfNeeded(currentItem item: AlbumEntity?) {
        guard let item = item else {
          return
        }

        let thresholdIndex = filteredAlbums.indices.last
        if filteredAlbums.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
          loadMore()
        }
      }
    
    func loadMore() {
        guard !isLoading && canLoadMorePages else {
              return
        }
        
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.pageNumber += 1
        let query = getQuery()
        self.artowrkDataService.fetch(query: query)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { albums in
                self.allAlbums.append(contentsOf: albums)
                self.isLoading = false
            }
            .store(in: &cancellabel)
    }
    
    func setObservers() {
        // mocking real world filtering here...
        $selectedSection
            .receive(on: DispatchQueue.main)
            .sink { currentSection in
                switch currentSection {
                case .uploads:
                    self.filteredAlbums = self.allAlbums
                case .exibitions:
                    self.filteredAlbums = self.allAlbums.filter { $0.id % 2 == 0 }
                case .revenue:
                    self.filteredAlbums = self.allAlbums.filter { $0.id % 2 != 0 }
                }
            }
            .store(in: &cancellabel)
        
        $allAlbums
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { albums in
                switch self.selectedSection {
                case .uploads:
                    self.filteredAlbums = albums
                case .exibitions:
                    self.filteredAlbums = albums.filter { $0.id % 2 == 0 }
                case .revenue:
                    self.filteredAlbums = albums.filter { $0.id % 2 != 0 }
                }
            })
            .store(in: &cancellabel)
    }
    
    func getQuery() -> [String: String] {
        return ["_page": "\(pageNumber)", "_limit": "\(limit)"]
    }
    
    private func fetchData() {
        let query = getQuery()
        self.artowrkDataService.fetch(query: query)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { albums in
                self.allAlbums = albums
                self.isLoading = false
            }
            .store(in: &cancellabel)
    }
}
