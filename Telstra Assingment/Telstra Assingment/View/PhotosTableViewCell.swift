//
//  PhotosTableViewCell.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//
import SDWebImage
import SnapKit
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // MARK: - Outlet Declaration
    
    private var imgImage: UIImageView = {
        let imgImage = UIImageView()
        imgImage.backgroundColor = .clear
        imgImage.clipsToBounds = true
        imgImage.layer.masksToBounds = true
        imgImage.contentMode = .scaleAspectFill
        return imgImage
    }()
    private let cellView: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = .white
        return cellView
    }()
    
    private let lblTitle: UILabel = {
        let lblTitle = UILabel()
        lblTitle.backgroundColor = .clear
        lblTitle.textColor = .black
        lblTitle.textAlignment = .left
        lblTitle.layer.cornerRadius = 5
        lblTitle.layer.masksToBounds = true
        lblTitle.numberOfLines = 0
        return lblTitle
    }()
    
    private let lblDesc: UILabel = {
        let lblDescription = UILabel()
        lblDescription.backgroundColor = .clear
        lblDescription.textColor = .gray
        lblDescription.textAlignment = .left
        lblDescription.layer.cornerRadius = 5
        lblDescription.layer.masksToBounds = true
        lblDescription.numberOfLines = 0
        return lblDescription
    }()
    
    // MARK: - Setting to views outlets
    
    var photosCellData: Row? {
        didSet {
            
            self.lblTitle.text = photosCellData?.title
            self.lblDesc.text = photosCellData?.rowDescription
            if let imageUrl = photosCellData?.imageHref {
                self.imgImage.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: Common.tempImage))
            }
            else {
                self.imgImage.image = UIImage(named: Common.tempImage)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setting up data for tableview cell
    
    private func setupUI() {
        self.backgroundColor = .black
        self.addSubview(cellView)
        self.addSubview(imgImage)
        self.addSubview(lblTitle)
        self.addSubview(lblDesc)
        
        cellView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0))
            make.height.greaterThanOrEqualTo(100).priority(999)
        }
        
        imgImage.snp.makeConstraints { make in
            make.left.equalTo(cellView.snp.left).offset(16)
            make.top.equalTo(cellView.snp.top).offset(16)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(cellView.snp.top).offset(8)
            make.left.equalTo(imgImage.snp.right).offset(16)
            make.right.equalTo(cellView.snp.right).offset(8)
            make.height.equalTo(30)
        }
        lblDesc.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(8)
            make.left.equalTo(imgImage.snp.right).offset(16)
            make.right.equalTo(cellView.snp.right).offset(-16)
            make.bottom.equalTo(cellView.snp.bottom).offset(-16)
        }
    }
}
