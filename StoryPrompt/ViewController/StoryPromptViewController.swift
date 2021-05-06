//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Morgan Duverney on 5/5/21.
//

import UIKit

class StoryPromptViewController: UIViewController {

  @IBOutlet weak var storyPromptTextView: UITextView!

  
  var storyPromptEntry: StoryPromptEntry?
  var isNewStoryPrompt = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    storyPromptTextView.text = storyPromptEntry?.description
    
    if isNewStoryPrompt {
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
      navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
    }
    }
  
  @objc func cancelStoryPrompt(_ sender: Any) {
    performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
  }
  
  @objc func saveStoryPrompt(_ sender: Any) {
    NotificationCenter.default.post(name: .StoryPromptSaved, object: storyPromptEntry)
    performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
  }
  
}

extension Notification.Name {
  static let StoryPromptSaved = Notification.Name("StoryPromptSaved")
}
