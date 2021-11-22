//
//  PhotosViewModal.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation
protocol photosViewModelDelegate {
    func didReceivePhotosResponse(photoResponse : PhotoResponse)
}

struct PhotosViewModal {
    var delegate : photosViewModelDelegate?
    func getPhotosData() {
        let photoResource = PhotoResource()
        photoResource.getPhotosWithDesc() { photoResponseApi in
            if photoResponseApi?.rows?.count != 0 {
                DispatchQueue.main.async {
                self.delegate?.didReceivePhotosResponse(photoResponse: photoResponseApi!)
                }
            }
            else {

            }
        }
    }
}
