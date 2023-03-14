//
//  MoviesViewController.swift
//  lab-tunley
//
//  Created by Kripa Lamichhane on 3/13/23.
//

import UIKit
import Nuke
class MoviesViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell

           // Use the indexPath.item to index into the albums array to get the corresponding album
           let movie = movies[indexPath.item]

           // Get the artwork image url
           let imageUrl = movie.poster_path

           // Set the image on the image view of the cell
           Nuke.loadImage(with: imageUrl, into: cell.movieImageView)
           return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    override func viewDidLoad() {
        collectionView.dataSource = self
        super.viewDidLoad()
        // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://itunes.apple.com/search?term=blackpink&attribute=artistTerm&entity=album&media=music")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
         // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            do {
                // Try to parse the JSON into a dictionary (aka: [String: Any])
                let decoder = JSONDecoder()
                do {
                    // Try to parse the response into our custom model
                    let response = try decoder.decode(MovieSearchResponse.self, from: data)
                    let movies = response.results
                    print(movies)
                    DispatchQueue.main.async {
                        self?.movies = movies
                        self?.collectionView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
            let layout = self?.collectionView.collectionViewLayout as! UICollectionViewFlowLayout

            // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
            // Set this to taste.
            layout.minimumInteritemSpacing = 4

            // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
            // Set this to taste.
            layout.minimumLineSpacing = 4

            // Set this to however many columns you want to show in the collection.
            let numberOfColumns: CGFloat = 3

            // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
            let width = (self?.collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

            // Set the size that each tem/cell should display at
            layout.itemSize = CGSize(width: width, height: width)
        }

        // Initiate the network request
        task.resume()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
