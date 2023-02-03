//
//  ViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 29.01.2023.
////
import SnapKit
import UIKit

final class ReadyPageViewController: UIViewController {
    // MARK: - Enum
    private enum Constants {
        static let imageName = "starWarsImage"
        static let labelText = "Explore the Star Wars universe"
        static let fontName = "Arial-BoldItalicMT"
        static let buttonTitle = "Let's go!  🚀"
    }

    // MARK: - Properties
    private let mainScreenVC = MainScreenViewController()

    private var backgroundImage: UIImageView?

    private lazy var starWarsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.imageName)
        image.contentMode = UIView.ContentMode.scaleAspectFit
        return image
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = Constants.labelText
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: Constants.fontName, size: 24)
        return label
    }()

    private lazy var letsGoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(gotoMainVC), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage = setBackgroundImage()
        configureStarWarsImage()
        configureButton()
        configureTextLabel()
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Private methods

    @objc private func gotoMainVC() {
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
