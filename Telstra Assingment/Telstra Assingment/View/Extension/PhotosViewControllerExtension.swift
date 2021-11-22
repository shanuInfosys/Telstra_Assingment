//
//  PhotosViewControllerExtension.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import Foundation
import UIKit
import SDWebImage
extension PhotosViewController : UITableViewDataSource , UITableViewDelegate{
 
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosTableData.rows?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.cellId, for: indexPath) as! PhotosTableViewCell
        cell.lblTitle.text = photosTableData.rows?[indexPath.row].title
        cell.lblDesc.text = photosTableData.rows?[indexPath.row].rowDescription
        if let imageUrl = photosTableData.rows?[indexPath.row].imageHref {
            cell.imgImage.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "temp"))
        }
        else {
            cell.imgImage.image = UIImage(named: "temp")
        }
        
        return cell
    }

}

