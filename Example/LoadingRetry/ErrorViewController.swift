//
//  ErrorViewController.swift
//  LoadingRetry_Example
//
//  Created by 刘波 on 2018/11/7.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    lazy var retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("点击重试", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addSubviews()
        setupConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func addSubviews() {
        view.addSubview(retryButton)
    }
    
    private func setupConstraints() {
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            retryButton.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -15),
            retryButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 15)
            
            ])
    }
}

