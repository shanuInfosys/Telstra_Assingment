//
//  PhotosTableViewCell.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import UIKit
import SnapKit
class PhotosTableViewCell: UITableViewCell {
    static var cellId = "cell"
    
    var imgImage: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = .clear
        v.clipsToBounds = true
        v.layer.masksToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    let cellView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()

        let lblTitle: UILabel = {
            let v = UILabel()
            v.backgroundColor = .clear
            v.textColor = .black
            v.textAlignment = .left
            v.layer.cornerRadius = 5
            v.layer.masksToBounds = true
            v.numberOfLines = 0
            return v
        }()
    
    let lblDesc: UILabel = {
        let v = UILabel()
        v.backgroundColor = .clear
        v.textColor = .gray
        v.textAlignment = .left
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        v.numberOfLines = 0
        return v
    }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func setupUI() {
              
            self.addSubview(cellView)
            self.addSubview(imgImage)
            self.addSubview(lblTitle)
            self.addSubview(lblDesc)
            
            cellView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4))
                make.height.greaterThanOrEqualTo(100).priority(999)
            }
            
            imgImage.snp.makeConstraints { (make) in
                make.left.equalTo(cellView.snp.left).offset(8)
                make.top.equalTo(cellView.snp.top).offset(8)
                make.width.equalTo(60)
                make.height.equalTo(60)
    
            }
            lblTitle.snp.makeConstraints { (make) in
                make.top.equalTo(cellView.snp.top).offset(8)
                make.left.equalTo(imgImage.snp.right).offset(8)
                make.right.equalTo(cellView.snp.right).offset(8)
                make.height.equalTo(30)
            }
            lblDesc.snp.makeConstraints { (make) in
                make.top.equalTo(lblTitle.snp.bottom).offset(8)
                make.left.equalTo(imgImage.snp.right).offset(8)
                make.right.equalTo(cellView.snp.right).offset(8)
                make.bottom.equalTo(cellView.snp.bottom).offset(-8)
            }
        }
}
