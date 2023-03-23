//
//  AppEnvironment.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation
import Combine

protocol AppEnvironmentProtocol: AnyObject {
    var appSandbox: Sandbox { get }
}

final class AppEnvironment: ObservableObject, AppEnvironmentProtocol {
    
    // can be configured with Multiple sandbox
    internal init(appSandbox: Sandbox) {
        self.appSandbox = appSandbox
    }
    
    let appSandbox: Sandbox

    static func bootstrap() -> AppEnvironment {
        let artowrkRepo = ArtworkDataService()
        let userRepo = UserProfileDataService()
        let sandbox = AppSandbox(artworkRepository: artowrkRepo, userRespository: userRepo)
        return AppEnvironment(appSandbox: sandbox)
    }
}

protocol Sandbox: AnyObject {
    var artworkRepository: ArtworkDataService {get set}
    var userRespository: UserProfileDataService {get set}
}

class AppSandbox: Sandbox {
    var artworkRepository: ArtworkDataService
    var userRespository: UserProfileDataService
    
    init(artworkRepository: ArtworkDataService, userRespository: UserProfileDataService) {
        self.artworkRepository = artworkRepository
        self.userRespository = userRespository
    }
}
