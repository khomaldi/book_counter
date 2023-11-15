//
//  ViewController.swift
//  book_counter
//
//  Created by Georgii Khomaldishvili on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        historyTextView.text = "История изменения:\n"
    }

    @IBAction func resetButtonDidTap() {
        reset()
    }
    
    @IBAction func decrementButtonDidTap() {
        decrement()
    }
    
    @IBAction func incrementButtonDidTap() {
        increment()
    }
    
    private var counter: Int = 0
    
    private let counterLabelText: String = "Значение счётчика: "
    
    private func reset() -> Void {
        counter = 0

        counterLabel.text = "\(counterLabelText) \(counter)"
        
        log(text: "значение сброшено")
    }

    private func decrement() -> Void {
        if counter == 0 {
            log(text: "попытка уменьшить значение счётчика ниже 0")
            
            return
        }
        
        counter -= 1
        
        counterLabel.text = "\(counterLabelText) \(counter)"
        
        log(text: "значение изменено на -1")
    }

    private func increment() -> Void  {
        counter += 1
        
        counterLabel.text = "\(counterLabelText) \(counter)"
        
        log(text: "значение изменено на +1")
    }
    
    private func log(text: String) -> Void {
        historyTextView.text += "[\(getCurrentDate())]: \(text)\n"
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"

        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
}

