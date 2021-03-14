//
//  DisplayTableViewController.swift
//  Mindful
//
//  Created by william on 3/13/21.
//
import UIKit

class DisplayTableViewController: UITableViewController, UISearchBarDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [Item] = []
    var selectedIndex: Int!
    
    var filteredData: [Item] = []
    var FD: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSearchBar()
        
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableView.automaticDimension
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    
    func fetchData() {
        
        do {
            items = try context.fetch(Item.fetchRequest())
            filteredData = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Couldn't Fetch Data")
        }
        
    }

}


extension DisplayTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "UpdateVC", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            
            let item = self.filteredData[indexPath.row]
            self.context.delete(item)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            self.filteredData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // delete item at indexPath
            
            print("Share")
            
        }
        
        delete.backgroundColor = UIColor(red: 0/255, green: 177/255, blue: 106/255, alpha: 1.0)
        share.backgroundColor = UIColor(red: 54/255, green: 215/255, blue: 183/255, alpha: 1.0)

        
        return [delete,share]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateVC" {
                let updateVC = segue.destination as! UpdateItemViewController
                updateVC.item = filteredData[selectedIndex!]
            }
        }
    
    
    func createSearchBar() {
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar

        
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredData = items
            FD = items.filter { ($0.name?.lowercased().contains(" die"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" dying"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" nightmare"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" kill"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" die"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" torture"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" torment"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" worthless"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" evil"))! }
            FD = items.filter { ($0.name?.lowercased().contains(" suicide"))! }
            
        } else {
            
            filteredData = items.filter { ($0.name?.lowercased().contains(searchText.lowercased()))! }
        }
        
        if FD.isEmpty == false {
            let alertController = UIAlertController(title: "iOScreator", message:
                "You seem to be having strongly negative thoughts that cannot cease to linger in your mind, day and night. It might be time to pause for a moment and think about the option of reaching out to someone professional who can help you with your situation. It is recommended that you do this as soon as possible. Please try to have more faith in yourself and others.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
            }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}
