//
//  DedailViewController.swift
//  Proyecto1
//
//  Created by Jonathan Ibarra on 13/2/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var favoriteButtonItem: UIBarButtonItem!
    
    
    @IBOutlet weak var thumbnailImagView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImageView: UIImageView!
   
    @IBOutlet weak var descriptionLabel: UILabel!
    
   
    
    
    var game: Game!
    
    
    var session: SessionManager = SessionManager()
    
    var isFavorite: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationItem.title = game.title
        
        titleLabel.text = game.title
        thumbnailImagView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        descriptionLabel.text = game.shortDescription
        platformImageView.image =  if game.platform == "PC (Windows)"{
            UIImage(systemName: "desktopcomputer")
        }else {
            UIImage(systemName: "safari")
        }
            
        
        
        isFavorite = session.isFavorite(id: game.id)
        setFavorito()
        
    }
    
     func setFavorito() {
        
        if isFavorite {
            favoriteButtonItem.image = UIImage(systemName: "heart.fill")
        }else {
            
            favoriteButtonItem.image = UIImage(systemName: "heart")
        }
        
    }
    
    @IBAction func setFavorito(_ sender: Any) {
        if isFavorite {
            session.setFavorite(id: game.id)
        } else {
            session.setFavorite(id: game.id)
        }
        
        isFavorite.toggle()
        setFavorito()
    }

    @IBAction func share(_ sender: Any) {
        
        let text = "Este es algun texto que yoquiero compartir"
        
        
        let textToShare = [text]
        
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
