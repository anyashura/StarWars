//
//  Extension UIVIewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 30.01.2023.
//

import Foundation
import UIKit

    // MARK: - Extensions

        // network
extension UIViewController {

    func checkConnection() {

        if !NetworkMonitor.shared.isConnected {
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

        // loader
extension UIViewController {

    func startLoader(spinner: UIActivityIndicatorView) {

        view.addSubview(spinner)
        spinner.center = self.view.center
        spinner.color = .white
        spinner.startAnimating()
        view.bringSubviewToFront(spinner)
        spinner.hidesWhenStopped = true

    }

    func stopLoader(spinner: UIActivityIndicatorView) {
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
}
        // backgroundImage
extension UIViewController {

    func setBackgroundImage() -> UIImageView {

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "milkyWay")
        view.addSubview(backgroundImage)
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill

        return backgroundImage
    }
}
