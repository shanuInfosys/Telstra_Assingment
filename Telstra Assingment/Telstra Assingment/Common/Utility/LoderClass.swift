//
//  LoderClass.swift
//  Telstra Assingment
//
//  Created by SHANU on 22/11/21.
//

import Foundation
import UIKit
import NVActivityIndicatorView
class  LoaderClass : NSObject {
    static let sharedInstance = LoaderClass()
        private override init() {
            super.init()
        }
    //let vc = UIApplication.topController()
    var activityIndicatorView: NVActivityIndicatorView?
    
    func setUpLoader(vc: UIViewController) {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicatorView = NVActivityIndicatorView(frame: (frame), type: .ballPulse, color: .systemPink, padding: 8)
        vc.view.addSubview(activityIndicatorView!)
        activityIndicatorView?.snp.makeConstraints { make in
            make.center.equalTo(vc.view.center)
           // make.centerY.equalTo(self.vc?.view.centerYAnchor)
        }
        activityIndicatorView?.startAnimating()
    }
    func stopLoader() {
        activityIndicatorView!.stopAnimating()
    }

}
