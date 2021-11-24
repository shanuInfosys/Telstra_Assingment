//
//  PhotosViewController.swift
//  Telstra Assingment
//
//  Created by SHANU on 20/11/21.
//
import SnapKit
import UIKit
class PhotosViewController: UIViewController {
    
    // MARK: - Outlet Declaration
    
    private var photosViewModel = PhotosViewModal()
    private var photosTableData = PhotoResponse()
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Variable Declaration
    
    private var isRefreshSelected = false
    lazy var photosTableView: UITableView = {
        
        let tempphotosTableView = UITableView()
        tempphotosTableView.estimatedRowHeight = 200
        tempphotosTableView.rowHeight = UITableView.automaticDimension
        tempphotosTableView.separatorStyle = .none
        tempphotosTableView.separatorColor = .black
        tempphotosTableView.allowsSelection = false
        tempphotosTableView.backgroundColor = .white
        return tempphotosTableView
    }()
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        photosTableView.addSubview(refreshControl)
        photosViewModel.delegate = self
        photosViewModel.getPhotosData()
        setupUI()
        LoaderClass.sharedInstance.setUpLoader(vc: self)
    }
}
// MARK: - Class Extension

extension PhotosViewController: PhotosViewModelDelegate {
    
    // MARK: - Delegate to pass data from viewmodal to Controller
    
    func didReceivePhotosResponse(photoResponse: PhotoResponse) {
        
        self.photosTableData.rows?.removeAll()
        self.photosTableData = photoResponse
        setTitleToNavBar(title: self.photosTableData.title ?? " ")
        self.photosTableView.dataSource = self
        self.photosTableView.reloadData()
        LoaderClass.sharedInstance.stopLoader()
        if isRefreshSelected == true {
            refreshControl.endRefreshing()
            isRefreshSelected = false
        }
    }
}

// MARK: - TableView Data Source

extension PhotosViewController: UITableViewDataSource {
    
    // MARK: - Table view datasource method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        {
            photosTableData.rows?.count ?? 0
        }()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Common.cellId, for: indexPath) as? PhotosTableViewCell else {
            return UITableViewCell()
        }
        cell.photosCellData = photosTableData.rows?[indexPath.row]
        return cell
    }
}

// MARK: - Method for registering UITableView Cell

private extension PhotosViewController {
    
    private func setupUI() {
        
        photosTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Common.cellId)
        self.view.addSubview(photosTableView)
        photosTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(4)
        }
    }
    
    // MARK: - Method for pull to refresh
    
    @objc private func refresh(_ sender: AnyObject) {
        
        isRefreshSelected = true
        photosViewModel.getPhotosData()
    }
    
    // MARK: - Method to set title for navigation bar
    
    private func setTitleToNavBar (title: String) {
        
        self.navigationItem.title = title
    }
}
