//
//  Extension UIVIewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 30.01.2023.
//

import Foundation
import UIKit

extension UIViewController {

    func checkConnection() {
        if NetworkMonitor.shared.isConnected {
//            print("Internet connection OK")
        } else {
//            print("Internet connection FAILED")
            self.showRetryAlert()
        }
    }

    func showRetryAlert() {
        let retryAlert = UIAlertController(title: "Warning", message: "No internet", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        retryAlert.addAction(action)
        self.present(retryAlert, animated: true, completion: nil)
    }

}
