//
//  UIViewController+RxSupport.swift
//  LoadingRetry
//
//  Created by liubo on 2018/4/18.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: LoadingRetryType {
    
    var loadingViewVisible: Binder<Bool> {
        return Binder(base) { viewController, visible in
            viewController.setLoadingView(visible: visible)
        }
    }
    
    var errorViewVisible: Binder<Bool> {
        return Binder(base) { viewController, visible in
            viewController.setErrorView(visible: visible)
        }
    }
}
