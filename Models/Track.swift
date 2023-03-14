//
//  Track.swift
//  Movie
//
//  Created by Kripa Lamichhane on 3/12/23.
//

import Foundation

// TODO: Pt 1 - Create a Track model struct

struct Track: Decodable {
    let overview: String
    let original_title: String
    let poster_path: URL

    // Detail properties
    let collectionName: String
    let primaryGenreName: String
    let release_date: Date
    let trackTimeMillis: Int
}
struct TracksResponse: Decodable{
    let results: [Track]
}

// TODO: Pt 1 - Create an extension with a mock tracks static var

extension Track {

    /// An array of mock tracks
    static var mockTracks: [Track]  = [
        Track(overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine live",
              original_title: "Puss in Boots: The Last Wish",
              poster_path: URL(string:"https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/c3/64/46/c364465f-6271-8aae-93a8-b9979d2befe5/20UMGIM82075.rgb.jpg/100x100bb.jpg")!,
             collectionName: "The Album",
             primaryGenreName: "K-Pop",
              release_date: Date(),
              trackTimeMillis: 157705),
        Track(overview: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost",
              original_title: "Knock at the Cabin",
              poster_path: URL(string: "/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")!,
              collectionName: "The Album",
              primaryGenreName: "K-Pop",
              release_date: Date(),
               trackTimeMillis: 157705),
        Track(overview: "Black Panther: Wakanda Forever Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              original_title: "Black Panther: Wakanda Forever",
              poster_path: URL(string: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
              collectionName: "The Album",
              primaryGenreName: "K-Pop",
              release_date: Date(),
               trackTimeMillis: 157705)
    ]

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
}

// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
