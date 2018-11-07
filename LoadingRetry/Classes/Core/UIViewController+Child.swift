//
//  UIViewController+Child.swift
//  LoadingRetry
//
//  Created by liubo on 2018/4/18.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func add(child: UIViewController, constraints: ((UIView) -> [NSLayoutConstraint])? = nil) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        if let constraints = constraints {
            NSLayoutConstraint.activate(constraints(child.view))
        } else {
            NSLayoutConstraint.activate([
                child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                child.view.topAnchor.constraint(equalTo: view.topAnchor),
                child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
    
    func remove(child: UIViewController) {
        guard child.parent != nil else { return }
        child.willMove(toParent: nil)
        child.removeFromParent()
        child.view.removeFromSuperview()
    }
}
