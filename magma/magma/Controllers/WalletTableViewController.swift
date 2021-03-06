//
//  WalletTableViewController.swift
//  magma
//
//  Created by Justin Wilkin on 17/5/19.
//  Copyright © 2019 Code Candy. All rights reserved.
//

import UIKit

class WalletTableViewController: UITableViewController {
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load our cards into our wallet
        CardAPI.shared().loadCards { (resultCode, message) in
            // If our server respons was successful get our cards
            switch resultCode {
            case Constants.SUCCESS:
                // On a success reloud our data
                _ = CardAPI.shared().newCard()
                _ = CardAPI.shared().newCard()
                _ = CardAPI.shared().newCard()
                _ = CardAPI.shared().newCard()
                self.tableView.reloadData()
            case Constants.FAILURE:
                print(message)
            default:
                print("Code: \(resultCode), \(message)")
            }
            
        }
    }
    
    // MARK: - Table View Recycling
    // Return the number of sections in our table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the amount of items we have in our table's data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardAPI.shared().getCards().count
    }
    
    // Create our cell for our table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // If we can reuse a cell use it
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellRecycler") as? WalletTableViewCell {
            // Populate the values of our card view (cell)
            let card = CardAPI.shared().getCards()[indexPath.row]
            cell.setup(card)
            
            return cell
        }
        
        // Our reuse cell returned null so create blank cell
        return UITableViewCell()
    }
    
    // MARK: - User Input
    // Handle selection of our table view cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
