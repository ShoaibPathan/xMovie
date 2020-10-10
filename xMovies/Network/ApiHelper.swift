//
//  ApiHelper.swift
//  xMovies
//
//  Created by DIAKO on 10/7/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import Foundation
import Alamofire

class ApiHelper {
    
    public static let API_KEY = "4f588b70"
    
    // falcon Verbs
    public let POST_VERB = "POST"
    public let GET_VERB = "GET"
    
//    let alamofire = SessionManager()
//    var jwtPersistable: JwtPersitable = JwtPersistor()
//    fileprivate var requestInterceptor:RequestInterceptor = RequestInterceptor()
    
    static let instance:ApiHelper = {
        let instance = ApiHelper()
        return instance
    }()
    
    private var session: Session!
    
    init() {
        let config = Session.default.session.configuration
        session = Session(configuration: config, interceptor: self)
    }
    
    
    func falconURLComponentsInstance(path:String? = nil) -> NSURLComponents {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = Bundle.main.infoDictionary!["FALCON_SCHEME"] as? String
        urlComponents.host = Bundle.main.infoDictionary!["FALCON_HOST"] as? String
//        urlComponents.port = NSNumber(value: Int(Bundle.main.infoDictionary!["FALCON_PORT"] as! String)!)
        urlComponents.path = "/\(path ?? "")"
        return urlComponents
    }
}

extension ApiHelper: RequestInterceptor {
    typealias AdapterResult = Swift.Result<URLRequest, Error>
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Swift.Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let query = URLQueryItem(name: "apikey", value: ApiHelper.API_KEY)
        
        completion(.success(urlRequest))
    }
}
