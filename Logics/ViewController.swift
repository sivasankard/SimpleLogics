//
//  ViewController.swift
//  Logics
//
//  Created by Ducere on 10/10/17.
//  Copyright © 2017 Ducere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logicType = ["Prime Numbers", "Fibonacii", "Fibonacci Rec", "Factorial Of", "Factorial Rec"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK:- Logics
    func getPrimeNumbers(num: Int) {
        
        let primeNumbers = NSMutableArray()
        if num <= 1 {
            return
        }
        for pnum in 2...num {
            var i = 2
            var isPrime = true
            while i < pnum {
                if pnum % i == 0 {
                    isPrime = false
                }
                i += 1
            }
            if isPrime {
                primeNumbers.add(pnum)
            }
            
        }
        
        print( "Prime numbers %d", primeNumbers)
        
    }
    
    func fibonacciSeries(num : Int) {
        
        var num1 = 0
        var num2 = 1
        
        for _ in 0...num {
            let newNum = num1 + num2
            num1 = num2
            num2 = newNum
            print(num2)
        }
        
    }
    
    func fibnacciSeriesRec(num1 : Int, num2 : Int, serial : Int )  {
        
        if serial == 0 {
            return
        }
        let newNum = num1 + num2
        self.fibnacciSeriesRec(num1: num2, num2: newNum, serial: serial - 1)
        print(newNum)
    }
    
    func factorialOfNNumbers(nNumbers : Int) {
        var factNum = 1
        var num = nNumbers
        while num >= 1 {
                factNum = factNum * num
                num -= 1
        }
        print(factNum)
    }
    
    func factorialRec(nNumber : Int, factNum : Int) {
        
        let newnum = factNum * nNumber
        if nNumber >= 1 {
            factorialRec(nNumber: nNumber-1, factNum: newnum)
        }
        if nNumber == 1 {
            print(newnum)
        }
    }
}


extension ViewController : UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logicType.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = logicType[indexPath.row]
        return cell!
    }


}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            getPrimeNumbers(num: 100)
        case 1:
            fibonacciSeries(num: 20)
        case 2:
            fibnacciSeriesRec(num1: 0, num2: 1, serial: 20)
        case 3:
            factorialOfNNumbers(nNumbers: 10)
        case 4:
            factorialRec(nNumber: 10, factNum: 1)
        
        default:
            break
        }
    }
    
}
