//
//  ConfirmationViewController.swift
//  ClubConnect
//
//  Created by Virgil on 10/10/26.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!

    var studentName = "Club Member"
    var wantsReminders = false
    var selectedRole = "Member"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Confirmation"

        let reminderMessage = wantsReminders
            ? "You will receive meeting reminders."
            : "Meeting reminders are turned off."

        // The message proves that all values were passed from the welcome screen.
        messageLabel.text = """
        Welcome, \(studentName)!

        You are joining Campus Club Connect as a \(selectedRole).

        \(reminderMessage)
        """
    }
}
