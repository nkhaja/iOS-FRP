//
//  ViewController.swift
//  RxCalculator
//
//  Created by Nikolas Burk on 09/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

  @IBOutlet weak var operationSegmentedControl: UISegmentedControl!
  @IBOutlet weak var firstValueTextField: UITextField!
  @IBOutlet weak var secondValueTextField: UITextField!
  @IBOutlet weak var operationLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!
    
    let calculator = Calculator()
    let disposeBag = DisposeBag()
  

  // MARK: View Controller Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let firstValueObservable: Observable<Int> = firstValueTextField.rx.text.map { string in
        return Int(string!)!
    }
    
    let secondValueObservable: Observable<Int> = secondValueTextField.rx.text.map { string in
        return Int(string!)!
    }
    
    let operationObservable: Observable<Calculator.Operation> = operationSegmentedControl.rx.value.map{ selectedIndex in
        let operation = Calculator.Operation(rawValue: selectedIndex)
    }
    
    let binding = Observable.combineLatest(firstValueObservable, secondValueObservable) { (firstValue:Int, secondValue:Int) in
        self.calculator.add(a: firstValue, b: secondValue)
        }.map{ result in
            return String(result)
    }.bindTo(resultLabel.rx.text)
    
    disposeBag.insert(binding)
    
  }

}

