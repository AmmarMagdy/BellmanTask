//
//  Request.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import Alamofire

class Request {
    
    static func requestAPI(router: Router, callbackSuccess: (([String:Any])->())?, callbackFail: ((Int?, String?)->())?, callbackEndDueToError: ((String)->())?) {
        AF.request(router).responseJSON {
            (response:DataResponse) in
            ActivityIndicator.instance.hide()
            switch(response.result) {
            case .success(_):
                if (response.value as? [String: Any]) != nil {
                    let objects = response.value as? [String: Any]
                    callbackSuccess!(objects!)
                }
                break
            case .failure(_):
                callbackEndDueToError!((response.error?.localizedDescription)!)
                break
            }
        }
    }
}

