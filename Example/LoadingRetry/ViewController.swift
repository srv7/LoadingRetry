//
//  ViewController.swift
//  LoadingRetry
//
//  Created by liubo on 11/07/2018.
//  Copyright (c) 2018 liubo. All rights reserved.
//
import UIKit
import LoadingRetry
import RxSwift
import RxCocoa

class ViewController: UIViewController, LoadingRetryType {
    lazy var loadingView: LoadingViewController = {
        return LoadingViewController()
    }()
    
    lazy var errorView: ErrorViewController = {
        return ErrorViewController()
    }()
    
    let bag = DisposeBag()
    
    var viewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchDataAction.executing
            .bind(to: rx.loadingViewVisible)
            .disposed(by: bag)
        
        viewModel.fetchDataAction.executing
            .filter { $0 }.map { !$0 }
            .bind(to: rx.errorViewVisible)
            .disposed(by: bag)
        
        viewModel.fetchDataAction.errors
            .map { _ in true }
            .bind(to: rx.errorViewVisible)
            .disposed(by: bag)
        
        errorView.retryButton.rx
            .bind(to: viewModel.fetchDataAction, input: Void())
        
        viewModel.fetchDataAction.elements
            .bind(to: tableView.rx.items) { tableView, row, element  in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = element
                return cell
            }.disposed(by: bag)
        
        viewModel.fetchDataAction.execute(Void())
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
