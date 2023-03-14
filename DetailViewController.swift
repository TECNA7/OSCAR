//
//  DetailViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/5/22.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var poster_path: UIImageView!
    @IBOutlet weak var overview: UILabel!

    @IBOutlet weak var original_titleLabel: UILabel!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var release_date: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    var track: Track!

    override func viewDidLoad() {
        super.viewDidLoad()

        Nuke.loadImage(with: track.poster_path, into: poster_path)
        overview.text = track.overview
        original_titleLabel.text = track.original_title
        movieLabel.text = track.collectionName
        genreLabel.text = track.primaryGenreName

        // Create a date formatter to style our date and convert it to a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        release_date.text = dateFormatter.string(from: track.release_date)

        // Use helper method to convert milliseconds into `mm:ss` string format
        durationLabel.text = formattedTrackDuration(with: track.trackTimeMillis)

    }


}
