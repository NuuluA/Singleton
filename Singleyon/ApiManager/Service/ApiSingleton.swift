//
//  ApiSingleton.swift
//  Singleyon
//
//  Created by Арген on 28.05.2021.
//

import Foundation

enum ApiType {
    case login
    case getAlbums
    case getUsers
    case getPosts
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var header: [String: String] {
        switch self {
        case .login:
            return ["authLogin": "12345"]
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .login: return "login"
        case .getAlbums: return "albums"
        case .getUsers: return "users"
        case .getPosts: return "posts"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var requset = URLRequest(url: url)
        requset.allHTTPHeaderFields = header
        
        switch self {
        case .login:
            requset.httpMethod = "POST"
        default:
            requset.httpMethod = "GET"
            
        }
        return requset
    }
    
}

class ApiManager {
    static let shared = ApiManager()
    
    func getUsers(comolition: @escaping(Users) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let users = try? JSONDecoder().decode(Users.self, from: data) {
                comolition(users)
            } else {
                comolition([])
            }
        }
        task.resume()
    }
    
    func getUsers(comolition: @escaping(Albums) -> Void) {
        let request = ApiType.getAlbums.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let albums = try? JSONDecoder().decode(Albums.self, from: data) {
                comolition(albums)
            } else {
                comolition([])
            }
        }
        task.resume()
    }
    
    func getUsers(comolition: @escaping(Posts) -> Void) {
        let request = ApiType.getPosts.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let posts = try? JSONDecoder().decode(Posts.self, from: data) {
                comolition(posts)
            } else {
                comolition([])
            }
        }
        task.resume()
    }
}

