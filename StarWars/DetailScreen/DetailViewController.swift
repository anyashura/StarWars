//
//  DetailViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 01.02.2023.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Properties

    private let cellID = "detailInformation"

    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "milkyWay")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        return backgroundImage
    }()

    private lazy var picture: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "milkyWay")
        image.contentMode = UIView.ContentMode.scaleAspectFit
        return image
    }()

    private var tableView: UITableView?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)

    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()

    }

}
