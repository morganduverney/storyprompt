//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Morgan Duverney on 5/4/21.
//

import UIKit

class AddStoryPromptViewController: UIViewController {
    
  @IBOutlet weak var nounTextField: UITextField!
  @IBOutlet weak var adjectiveTextField: UITextField!
  @IBOutlet weak var verbTextField: UITextField!
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var numberSlider: UISlider!
  @IBOutlet weak var storyPromptImageView: UIImageView!
  
  var storyPromptEntry = StoryPromptEntry()
  
  @IBAction func changeNumber(_ sender: UISlider) {
    let number = Int(sender.value)
    numberLabel.text = "Number: \(number)"
    storyPromptEntry.number = number
  }
  @IBAction func changeStoryType(_ sender: UISegmentedControl) {
    storyPromptEntry.genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) ?? .scifi
  }
  
  @IBAction func generateStoryPrompt(_ sender: UIButton) {
    updateStoryPrompt()
    if storyPromptEntry.isValid() {
      performSegue(withIdentifier: "StoryPrompt", sender: nil)
    } else {
      let alert = UIAlertController(title: "Invalid Story Prompt", message: "Please fill out all of the fields", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default))
      present(alert, animated:  true)
    }
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    numberSlider.value = 7.5
    storyPromptEntry.number = Int(numberSlider.value)
    NotificationCenter.default.addObserver(self, selector: #selector(updateStoryPrompt), name: UIResponder.keyboardDidHideNotification, object: nil)
  }
  
  @objc func updateStoryPrompt() {
    storyPromptEntry.noun = nounTextField.text ?? ""
    storyPromptEntry.adjective = adjectiveTextField.text ?? ""
    storyPromptEntry.verb = verbTextField.text ?? ""
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "StoryPrompt" {
      guard let storyPromptViewController = segue.destination as? StoryPromptViewController else { return }
      storyPromptViewController.storyPromptEntry = storyPromptEntry
      storyPromptViewController.isNewStoryPrompt = true
    }
  }
}

extension AddStoryPromptViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
