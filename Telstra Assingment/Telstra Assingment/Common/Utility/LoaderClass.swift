//  LoderClass.swift
//  Telstra Assingment
//
//  Created by SHANU on 22/11/21.
//

import Foundation
import NVActivityIndicatorView
import UIKit

// MARK: - Loader Initialization

class  LoaderClass: NSObject {
    
    static let sharedInstance = LoaderClass()
    
    var activityIndicatorView: NVActivityIndicatorView?
    
    override private init() {
        super.init()
    }
    
    // MARK: - Loader Started
    
    func setUpLoader(vc: UIViewController) {
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicatorView = NVActivityIndicatorView(frame: (frame), type: .ballPulse, color: .systemPink, padding: 8)
        guard activityIndicatorView != nil else {
            return
        }
        guard let activityView = activityIndicatorView else {
            return
        }
        vc.view.addSubview(activityView)
        activityIndicatorView?.snp.makeConstraints { make in
            make.center.equalTo(vc.view.center)
        }
        activityIndicatorView?.startAnimating()
    }
    
    // MARK: - Loader Stopped
    
    func stopLoader() {
        activityIndicatorView?.stopAnimating()
    }
}
