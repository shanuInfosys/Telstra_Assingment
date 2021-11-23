//
//  PhotosViewModal.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation
// MARK: - Protocol Creation for passing data to View Controller
protocol photosViewModelDelegate: AnyObject {
    func didReceivePhotosResponse(photoResponse: PhotoResponse)
}
// MARK: - Method for getting data to pass to reqyured views
struct PhotosViewModal {
    weak var delegate: photosViewModelDelegate?
    
    func getPhotosData() {
        let photoResource = PhotoResource()
        photoResource.getPhotosWithDesc { photoResponseApi in
            guard let pResponse = photoResponseApi else {
                return
            }
                DispatchQueue.main.async {
                self.delegate?.didReceivePhotosResponse(photoResponse: pResponse)
                }
        }
    }
}
