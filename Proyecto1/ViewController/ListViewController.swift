//
//  ViewController.swift
//  Proyecto1
//
//  Created by Jonathan Ibarra on 13/2/26.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var gameList: [Game] = []
    var filteredGameList: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
         
        Task {
             gameList = await GameProvider.getGameList()
             filteredGameList = gameList
           
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        let game = filteredGameList[indexPath.row]
        cell.configure(with: game)
        return cell
    }
    
    //Para buscar
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       if searchText.isEmpty {
           filteredGameList = gameList
       }else{
           filteredGameList = gameList.filter { game in
               game.title.localizedCaseInsensitiveContains(searchText)
               
           }
       }
       tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredGameList = gameList
        tableView.reloadData()
    }

    // celda no este marcada
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let game = filteredGameList[indexPath.row]
        detailViewController.game = game
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

