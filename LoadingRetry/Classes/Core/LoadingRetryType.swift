//
//  LoadingRetryType.swift
//  LoadingRetry
//
//  Created by liubo on 2018/4/18.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import UIKit

public protocol LoadingRetryType where Self: UIViewController {
    
    associatedtype Loading where Loading: UIViewController
    associatedtype Error where Error: UIViewController
    
    var loadingView: Loading { get set }
    var errorView: Error { get set }
}

public extension LoadingRetryType {
    
    func setLoadingView(visible: Bool) {
        visible ? add(child: loadingView) : remove(child: loadingView)
    }
    
    func setErrorView(visible: Bool) {
        visible ? add(child: errorView) : remove(child: errorView)
    }
}
