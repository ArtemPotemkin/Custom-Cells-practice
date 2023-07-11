//
//  ContactListSectionViewController.swift
//  Custom Cells practice
//
//  Created by Артём Потёмкин on 10.07.2023.
//

import UIKit

class ContactListSectionViewController: UITableViewController {
    
    var persons = Person.getPersons()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact List"
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons[section].rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let person = persons[indexPath.section]
        content.text = person.rows[indexPath.row]
        
        content.image = indexPath.row == 0
        ? UIImage(systemName: "phone")
        : UIImage(systemName: "mail")
        

        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ContactListSectionViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderTableViewCell
        let person = persons[section]
        cell?.fullNameLabel.text = person.fullName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    /*
     override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     let fullNameLabel = UILabel(
     frame: CGRect(
     x: 16,
     y: 3,
     width: tableView.frame.width,
     height: 20
     )
     )
     fullNameLabel.text = persons[section].fullName
     fullNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
     fullNameLabel.textColor = .white
     
     let contentView = UIView()
     contentView.addSubview(fullNameLabel)
     
     return contentView
     }
     */
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = .gray
    }
}
