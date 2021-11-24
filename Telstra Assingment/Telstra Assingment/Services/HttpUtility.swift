//
//  HttpUtility.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation

// MARK: - Get method request

struct HttpUtility {
    
    func getApiData<T: Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?) -> Void) {
        
        // MARK: - Creating a session
        
        let task = URLSession.shared.dataTask(with: requestUrl) { responseData, _, error in
            guard error == nil else {
                return
            }
            guard responseData != nil else {
                return
            }
            guard let resData = responseData else {
                return
            }
            guard let string = String(data: resData, encoding: String.Encoding.isoLatin1) else { return }
            guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
            do {
                let result = try JSONDecoder().decode(T.self, from: properData)
                _ = completionHandler(result)
            }
            catch _ {
            }
        }
        
        // MARK: - Ending the session
        task.resume()
    }
}
