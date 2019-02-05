//
//  SupervillainVC.swift
//  RamirezAssessmentUpdated
//
//  Created by Ivan Ramirez on 2/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class SupervillainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var names: [Supervillain] = []
    
    private let supervillainCell = "supervillainCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        names = SupervillainController.shared.names
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func shuffleButtonTapped(_ sender: Any) {
        names.shuffleArray1()
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        presentEntryAlert()
    }
}

extension SupervillainVC: UITableViewDataSource, UITableViewDelegate {
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            let name = SupervillainController.shared.names[indexPath.row]
    //            SupervillainController.shared.remove(superVillains: name)
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //            tableView.reloadData()
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Supervillain Group \(section + 1)"
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return SupervillainController.shared.section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //[Even] [Odd] -- [0] [1]
        if names.count % 2 != 0 && section == SupervillainController.shared.section - 1
        {
            return  1
        }
        return SupervillainController.shared.groupMatrix
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: supervillainCell, for: indexPath)
        
        // in order to create the group effect - sections & rows
        let nameRow = indexPath.row + (SupervillainController.shared.groupMatrix * indexPath.section)
        
        let name = names[nameRow]
        cell.textLabel?.text = name.name
        
        return cell
    }
}

extension SupervillainVC {
    
    func presentEntryAlert() {
        let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 50, height: 50))
        imageView.image = UIImage(named: "supervillain")
        
        let alertController = UIAlertController(title: "Enter Your Favorite Supervillain's Name", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (titleTextField) in
            titleTextField.placeholder = "Example: Venom"
        }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let newName = alertController.textFields?.first?.text, !newName.isEmpty else { return }
            
            let supervillainName = SupervillainController.shared.add(name: newName)
            
            self.names.append(supervillainName)
            self.tableView.reloadData()
        }
        
        [dismissAction, saveAction].forEach { alertController.addAction($0) }
        alertController.view.addSubview(imageView)
        present(alertController, animated: true, completion: nil)
    }
}
