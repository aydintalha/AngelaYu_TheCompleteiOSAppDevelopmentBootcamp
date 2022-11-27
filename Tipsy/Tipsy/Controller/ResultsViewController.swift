import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalLabelText = ""
    var settingsLabelText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalLabelText
        settingsLabel.text = settingsLabelText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
