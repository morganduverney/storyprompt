//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Morgan Duverney on 5/5/21.
//

import UIKit

class StoryPromptViewController: UIViewController {

  @IBOutlet weak var storyPromptTextView: UITextView!
  @IBAction func cancelStoryPrompt(_ sender: Any) {
    performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
  }
  
  var storyPromptEntry: StoryPromptEntry?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    storyPromptTextView.text = storyPromptEntry?.description
    }
}
