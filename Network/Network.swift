//
//  Network.swift
//  Network
//
//  Created by Chittapon Thongchim on 25/9/2561 BE.
//  Copyright © 2561 Chittapon Thongchim. All rights reserved.
//

import Foundation
import CodableAlamofire
import Alamofire
import RxSwift

public class Network {
    
    public func request<Model: Decodable>(router: Routable) -> Observable<Model> {
        
        return Observable.create({ (observer) -> Disposable in
            
            let request = Alamofire.request(router.url, method: router.method, parameters: router.parammeters, encoding: router.encoding, headers: router.headers).responseDecodableObject { (response: DataResponse<Model>) in
                
                switch response.result {
                    
                case .success(let object):
                    observer.onNext(object)
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
