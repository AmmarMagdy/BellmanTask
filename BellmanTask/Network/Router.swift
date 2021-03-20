//
//  Router.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static var baseURL = "http://bellman-bd.restart-technology.com/"
    
    case getHome
    
    var url: URL {
        switch self {
        case .getHome:
            return URL(string: Router.baseURL + "api/home")!
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getHome:
            return .get
        }
    }
    
    var header: [String: Any]? {
        switch self {
        case .getHome:
            return nil
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getHome:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        return urlRequest
    }
    
}
