//
//  ViewController.swift
//  Proyecto1
//
//  Created by Jonathan Ibarra on 13/2/26.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var gameList: [Game] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
 
        
        Task {
            gameList = await GameProvider.getGameList()
            /*let game = await GameProvider.getGameById(id: 540)
            if let game = game {
                print(game)
            }else {
                print("Hubo un error parceando los datos")
            }*/
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        let game = gameList[indexPath.row]
        cell.configure(with: game)
        return cell
    }
}

