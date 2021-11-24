//
//  PhotoResource.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation
import NVActivityIndicatorView

// MARK: - Api for getting data from the server

struct PhotoResource {
    
    func getPhotosWithDesc(completion: @escaping(_ result: PhotoResponse?) -> Void) {
        
        // MARK: - Creating Depedency Injection for Utility Class
        
        let httpUtility = HttpUtility()
        guard let requestUrl = URL(string: Common.photodata) else {
            return
        }
        
        // MARK: - Api calling and eliminating null data
        
        httpUtility.getApiData(requestUrl: requestUrl, resultType: PhotoResponse.self) { photoApiResponse in
            guard photoApiResponse != nil else {
                return
            }
            var tempModal = photoApiResponse
            tempModal?.rows?.removeAll()
            guard photoApiResponse?.rows?.isEmpty != true else {
                return
            }
            for index in 0..<(photoApiResponse?.rows?.count ?? 0) {
                guard let dict = photoApiResponse?.rows?[index] else {
                    return
                }
                if dict.rowDescription != nil || dict.title != nil {
                    tempModal?.rows?.append(dict)
                }
            }
            _ = completion(tempModal)
        }
    }
}
