//
//  HttpUtility.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation
struct HttpUtility {
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                
                guard let string = String(data: responseData!, encoding: String.Encoding.isoLatin1) else { return }
                guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
                do {
                    let result = try JSONDecoder().decode(T.self, from: properData)
                      _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }
            
        }.resume()
    }
}
