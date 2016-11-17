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
    
    let operationObservable: Observable<Calculator.Operation> = operationSegmentedControl.rx.value.map{
        selectedIndex in
        let operation = Calculator.Operation(rawValue: selectedIndex)
        return operation!
    }
    
    let firstValueObservable: Observable<Int> = firstValueTextField.rx.text.map { string in
        if string == nil || string == ""{
            return 0
        }
            
        else{
            return Int(string!)!
        }
        
    }
    
    let secondValueObservable: Observable<Int> = secondValueTextField.rx.text.map { string in
        if string == nil || string == ""{
            return 0
        }
        
        else{
             return Int(string!)!
        }
       
    }
    
    let signObservable: Observable<String> = operationObservable.map { (operation: Calculator.Operation) in
        return self.calculator.sign(for: operation)
        
    }
    
    operationObservable.map{ operation in
        return self.calculator.sign(for: operation)
    }.bindTo(operationLabel.rx.text).addDisposableTo(disposeBag)
    
    
    
    Observable.combineLatest(firstValueObservable, secondValueObservable, operationObservable) { (firstValue:Int, secondValue:Int, operation:Calculator.Operation) in
        var result: Int
        
        switch operation{
        case .addition:
            result = self.calculator.add(a: firstValue, b: secondValue)
        case .subtraction:
            result = self.calculator.subtract(a: firstValue, b: secondValue)
        }
        return String(result)
    }.bindTo(self.resultLabel.rx.text).addDisposableTo(self.disposeBag)
    

  }

}


