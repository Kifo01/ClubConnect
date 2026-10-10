//
//  WelcomeViewController.swift
//  ClubConnect
//
//  Created by Virgil on 10/10/26.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Welcome"
        titleLabel.text = "Campus Club Connect"
    }

    @IBAction func joinButtonTapped(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        performSegue(withIdentifier: "ShowConfirmationSegue", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowConfirmationSegue",
              let confirmationViewController = segue.destination as? ConfirmationViewController else {
            return
        }

        // Keep the confirmation screen safe when the name field is left blank.
        let enteredName = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let studentName = enteredName.isEmpty ? "Club Member" : enteredName
        let selectedRole = roleSegmentedControl.selectedSegmentIndex == 1 ? "Officer" : "Member"

        confirmationViewController.studentName = studentName
        confirmationViewController.wantsReminders = reminderSwitch.isOn
        confirmationViewController.selectedRole = selectedRole
    }
}
