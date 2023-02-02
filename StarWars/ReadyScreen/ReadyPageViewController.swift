//
//  ViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 29.01.2023.
////
import SnapKit
import UIKit

final class ReadyPageViewController: UIViewController {
    // MARK: - Properties

    private let mainScreenVC = MainScreenViewController()

    private lazy var starWarsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "starWarsImage")
        image.contentMode = UIView.ContentMode.scaleAspectFit
        return image
    }()

    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "milkyWay")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        return backgroundImage
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Explore the Star Wars universe"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Arial-BoldItalicMT", size: 24)
        return label
    }()

    private lazy var letsGoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Let's go!  🚀", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(gotoMainVC), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        configureStarWarsImage()
        configureButton()
        configureTextLabel()
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Private methods

    @objc private func gotoMainVC() {
        print("Button tapped!")
        self.navigationController?.pushViewController(mainScreenVC, animated: true)
    }

    private func configureStarWarsImage() {
        view.addSubview(starWarsImage)
        starWarsImage.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }

    private func configureButton() {
        view.addSubview(letsGoButton)
        letsGoButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(170)
            $0.bottom.equalToSuperview().inset(60)
            $0.height.equalTo(40)
        }
    }

    private func configureTextLabel() {
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(starWarsImage.snp.bottom).offset(25)
            $0.height.equalTo(70)
        }
    }
}
