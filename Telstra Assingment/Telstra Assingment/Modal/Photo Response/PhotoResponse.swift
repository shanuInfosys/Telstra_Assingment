//
//  PhotoResponse.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation

// MARK: - PhotoResponse
struct PhotoResponse: Codable {
    var title: String?
    var rows: [Row]?
 
}
struct Row: Codable {
    var title, rowDescription: String?
    var imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}

func removeNullDataFromModal(modal : inout PhotoResponse) -> PhotoResponse{
    var tempModal = modal
    tempModal.rows?.removeAll()
    for index in 0..<modal.rows!.count {
        let dict = modal.rows![index]
        if dict.rowDescription != nil || dict.title != nil {
            tempModal.rows?.append(dict)
        }
        
    }
    return tempModal
}
