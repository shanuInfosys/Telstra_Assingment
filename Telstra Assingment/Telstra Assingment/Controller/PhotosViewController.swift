//
//  PhotosViewController.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//

import UIKit
import SnapKit
import NVActivityIndicatorView
class PhotosViewController: UIViewController {
    
    var photosViewModel : PhotosViewModal = PhotosViewModal()
    var photosTableData = PhotoResponse()
    var items: [String] = []
    var photoResponseObj : PhotoResponse = PhotoResponse()
    let navbar = UIView()
    let titleLabel = UILabel()

    lazy var photosTableView: UITableView = {
        let v = UITableView()
        v.estimatedRowHeight = 150
        v.rowHeight = UITableView.automaticDimension
        v.separatorStyle = .singleLine
        v.separatorColor = .black
        v.allowsSelection = false
        v.backgroundColor = .clear
        return v
    }()
    
    
    let navigationView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let label: UILabel = {
        let v = UILabel()
        v.backgroundColor = .clear
        v.textColor = .white
        v.textAlignment = .center
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        v.numberOfLines = 0
        return v
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosViewModel.delegate = self
        photosViewModel.getPhotosData()
        setUpNavBar()
        LoaderClass.sharedInstance.setUpLoader(vc: self)
    }
    
    func setUpNavBar() {
        
        let superview = self.view
        superview!.addSubview(navbar)
        navbar.backgroundColor = .white
        navbar.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalToSuperview()
            make.top.equalTo(superview?.snp.top as! ConstraintRelatableTarget)
            
        }
        navbar.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(navbar).offset(8)
        }
        setupUI()
    }
    
    
    func setTitleToNavBar (title : String) {
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("NotificationIdentifier"), object: nil)
    }
    
    func setupUI() {
        
        photosTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.cellId)
        self.view.addSubview(photosTableView)
        photosTableView.snp.makeConstraints { (make) in
            make.top.equalTo(navbar.snp.bottom).offset(1)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(4)
        }
    }
}

extension PhotosViewController : photosViewModelDelegate {
    func didReceivePhotosResponse(photoResponse: PhotoResponse) {
        
        var tempModal = photoResponse
        let getUpdatedModal = removeNullDataFromModal(modal: &tempModal)
        self.photosTableData = getUpdatedModal
        setTitleToNavBar(title: self.photosTableData.title ?? " ")
        self.photosTableView.dataSource = self
        self.photosTableView.delegate = self
        self.photosTableView.reloadData()
        LoaderClass.sharedInstance.stopLoader()
        
       // stopLoader()
    }
}

