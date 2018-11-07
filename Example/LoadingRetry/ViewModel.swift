//
//  ViewModel.swift
//  LoadingRetry_Example
//
//  Created by 刘波 on 2018/11/7.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Action
import RxSwift

class ViewModel {
    lazy var fetchDataAction: Action<Void, [String]> = {
        return Action { _ in
            return Observable<[String]>.create { (observer) -> Disposable in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    let flag = arc4random_uniform(10) % 2 == 0
                    if flag {
                        let elements = Array(repeating: "Hello World", count: 20)
                        observer.onNext(elements)
                        observer.onCompleted()
                    } else {
                        let error = NSError(domain: "domain", code: URLError.badServerResponse.rawValue, userInfo: nil)
                        observer.onError(error)
                    }
                })
                return Disposables.create()
            }
        }
    }()
}
