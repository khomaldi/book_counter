//
//  ViewController.swift
//  book_counter
//
//  Created by Georgii Khomaldishvili on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextView.text = "История изменения:\n"
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
        
        let range = NSRange(location: historyTextView.text.count - 1, length: 0)
        historyTextView.scrollRangeToVisible(range)
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"

        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var incrementButton: UIButton!

    @IBOutlet private weak var historyTextView: UITextView!
    
    @IBAction private func resetButtonDidTap() {
        reset()
    }
    
    @IBAction private func decrementButtonDidTap() {
        decrement()
    }
    
    @IBAction private func incrementButtonDidTap() {
        increment()
    }
}

