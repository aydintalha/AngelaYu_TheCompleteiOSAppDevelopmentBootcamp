import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 1.0
    var numberOfPeople = 2
    var bilTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == zeroPctButton.currentTitle {
            tip *= 0.0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender.currentTitle == tenPctButton.currentTitle {
            tip *= 0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if sender.currentTitle == twentyPctButton.currentTitle {
            tip *= 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            let billTotal = Double(bill) ?? 0.0
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            let result2DecimalPlaces = String(format: "%.2f", result)
            print(result2DecimalPlaces)
            finalResult = result2DecimalPlaces
            self.performSegue(withIdentifier: "toResult", sender: self)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destinatinVC = segue.destination as! ResultsViewController
            destinatinVC.totalLabelText = finalResult
            destinatinVC.settingsLabelText = "Split between \(numberOfPeople) with \(Int(tip * 100))% tips"
        }
        
    }
}

