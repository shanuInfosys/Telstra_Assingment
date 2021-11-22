//
//  PhotoResource.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation
import NVActivityIndicatorView
struct PhotoResource
{
    func getPhotosWithDesc(completion: @escaping(_ result : PhotoResponse?) -> Void)
    {
                
        let httpUtility = HttpUtility()
        let photoEndpoint = "\(ApiEndpoints.photo_data)"
        let requestUrl = URL(string:photoEndpoint)!
        httpUtility.getApiData(requestUrl: requestUrl, resultType: PhotoResponse.self) { (photoApiResponse) in
            _ = completion(photoApiResponse)
        }
    }
}
