//
//  File.swift
//  Mindful
//
//  Created by william on 3/13/21.
//

import UIKit

class UpdateItemViewController: UIViewController, UITextViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item: Item!
    
    @IBOutlet weak var entryText: UITextView!
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateAction(_ sender: Any) {
        
        guard let newEntry = entryText.text else  {
            return
        }
        
        item.name = newEntry
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        entryText!.delegate = self
        entryText!.becomeFirstResponder()
        configureEntryData(entry: item)
        
        print(item)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configureEntryData(entry: Item) {
        
        guard let text = entry.name else {
            return
        }
        
        entryText!.text = text
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
}
