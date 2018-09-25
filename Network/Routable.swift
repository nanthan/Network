//
//  Routable.swift
//  Network
//
//  Created by Chittapon Thongchim on 25/9/2561 BE.
//  Copyright © 2561 Chittapon Thongchim. All rights reserved.
//

import Alamofire

public protocol Routable: URLRequestConvertible {
    init(url: String, method: HTTPMethod, parammeters: Parameters?, headers: HTTPHeaders?, encoding: ParameterEncoding)
    var url: String { get }
    var method: HTTPMethod { get }
    var parammeters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}
