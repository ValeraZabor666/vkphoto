//
//  CollectionInteractor.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation

protocol CollectionInteractorProtocol {
    var presenter: CollectionPresenterProtocol? { get set }
    
    func getURL()
}

class CollectionInteractor: CollectionInteractorProtocol{
    
    var presenter: CollectionPresenterProtocol?
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func getURL() {
        
        var components = URLComponents()
        let ownerId = "-128666765"
        let albumId = "266276915"
        
        guard let token = authService.token else { return }
        let params = ["owner_id": ownerId, "album_id": albumId]
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = "5.131"
        
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/photos.get"
        components.queryItems = allParams.map { URLQueryItem(name: $0, value: $1) }
        
        let url = components.url!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        getJSON(url: url) { (data, error) in
            guard let data = data else { return }
            let response = try? decoder.decode(Response.self, from: data)
            
//            response?.response.items.map { print(Date(timeIntervalSince1970: $0.date))
//                print($0.sizes[0].url)
//            }
            self.presenter?.uploadPhoto(photos: response!)
        }
    }
    
    private func getJSON(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
    
}
