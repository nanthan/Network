//
//  Router.swift
//  Network
//
//  Created by Chittapon Thongchim on 25/9/2561 BE.
//  Copyright © 2561 Chittapon Thongchim. All rights reserved.
//

import Alamofire

public class Router: Routable {
    
    public let url: String
    public let method: HTTPMethod
    public let parammeters: Parameters?
    public let headers: HTTPHeaders?
    public let encoding: ParameterEncoding
    
    required public init(url: String, method: HTTPMethod = .get, parammeters: Parameters? = nil, headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default) {
        self.url = url
        self.method = method
        self.parammeters = parammeters
        self.headers = headers
        self.encoding = encoding
    }
    
    public func asURLRequest() throws -> URLRequest {
        let request = try URLRequest(url: url, method: method, headers: headers)
        return try encoding.encode(request, with: parammeters)
    }
    
}
