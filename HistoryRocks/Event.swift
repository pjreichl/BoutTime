//
//  Event.swift
//  HistoryRocks
//
//  Created by Peter Reichl on 8/29/18.
//  Copyright © 2018 Peter Reichl. All rights reserved.
//

import GameKit

var roundsPlayed = 0
var correctAnswers = 0

struct Event {
    var description: String
    var date: Double
    var eventLink: String
}

struct GameRound {
    var events: [Event]
    
    func orderedCorrectly() -> Bool {
        
        if events[0].date < events[1].date && events[1].date < events[2].date && events[2].date < events[3].date {
            return true
        } else {
            return false
        }
    }
}

var eventRound = GameRound(events: [])
var selectedEvent = Event(description: "", date: 0, eventLink: "")

let allEvents: [Event] = [
    
    Event(description: "Bob Dylan goes electric", date: 1965.0725, eventLink: "https://en.wikipedia.org/wiki/Electric_Dylan_controversy"),
    Event(description: "The Beach Boys release \"Pet Sounds\" album", date: 1966.0515, eventLink: "https://en.wikipedia.org/wiki/Pet_Sounds"),
    Event(description: "The Beatles release Sgt Peppers album", date: 1967.0526, eventLink: "https://en.wikipedia.org/wiki/Sgt._Pepper%27s_Lonely_Hearts_Club_Band"),
    Event(description: "Original Woodstock festival", date: 1969.0815, eventLink: "https://en.wikipedia.org/wiki/Woodstock"),
    Event(description: "Ramones play first gig at CBGB’s", date: 1974.0816, eventLink: "https://www.history.com/this-day-in-history/the-ramones-play-their-first-public-gig-at-cbgbs-in-downtown-manhattan"),
    Event(description: "Elvis Presley passes away", date: 1977.0816, eventLink: "https://en.wikipedia.org/wiki/Elvis_Presley"),
    Event(description: "The Sugar Hill Gang’s \"Rappers Delight\" enters the Billboard charts", date: 1979.1013, eventLink: "https://en.wikipedia.org/wiki/Rapper%27s_Delight"),
    Event(description: "The Blues Brothers movie is released", date: 1980.0616, eventLink: "https://www.imdb.com/title/tt0080455/"),
    Event(description: "John Lennon murdered", date: 1980.1208, eventLink: "https://en.wikipedia.org/wiki/Murder_of_John_Lennon"),
    Event(description: "Bob Marley passes away", date: 1981.0511, eventLink: "https://en.wikipedia.org/wiki/Bob_Marley"),
    Event(description: "MTV premieres  ", date: 1981.0801, eventLink: "https://en.wikipedia.org/wiki/MTV"),
    Event(description: "Simon and Garfunkel Concert in Central Park", date: 1981.0919, eventLink: "https://en.wikipedia.org/wiki/The_Concert_in_Central_Park"),
    Event(description: "The first Compact Disc is released", date: 1982.0817, eventLink: "https://en.wikipedia.org/wiki/Compact_disc"),
    Event(description: "Michael Jackson moonwalks on television", date: 1983.0325, eventLink: "https://www.rollingstone.com/music/music-news/inside-michael-jacksons-iconic-first-moonwalk-onstage-56650/"),
    Event(description: "The movie \"Purple Rain\" opens", date: 1984.0727, eventLink: "https://en.wikipedia.org/wiki/Purple_Rain_(film)"),
    Event(description: "Live Aid charity concert", date: 1985.0713, eventLink: "https://en.wikipedia.org/wiki/Live_Aid"),
    Event(description: "The first Farm Aid concert", date: 1985.0922, eventLink: "https://en.wikipedia.org/wiki/Farm_Aid"),
    Event(description: "Run-DMC pairs up with Aerosmith", date: 1986.1021, eventLink: "https://www.theguardian.com/music/musicblog/2016/jul/04/walk-this-way-run-dmc-aerosmith"),
    Event(description: "U2 releases \"The Joshua Tree\"", date: 1987.0309, eventLink: "https://en.wikipedia.org/wiki/The_Joshua_Tree"),
    Event(description: "NWA releases \"F*#% tha Police\"", date: 1988.0809, eventLink: "https://en.wikipedia.org/wiki/Fuck_tha_Police"),
    Event(description: "Sub Pop Records is founded", date: 1988.0811, eventLink: "https://en.wikipedia.org/wiki/Sub_Pop"),
    Event(description: "John Cusack holds up the boombox in \"Say Anything\"", date: 1989.0404, eventLink: "http://entertainment.time.com/2009/11/02/top-10-cameron-crowe-moments/"),
    Event(description: "Bruce Springsteen fires the E Street Band", date: 1989.1018, eventLink: "https://www.rollingstone.com/music/music-lists/the-25-boldest-career-moves-in-rock-history-150807/bruce-springsteen-fires-the-e-street-band-158952/"),
    Event(description: "Perry Farrell launches the first Lollapalooza touring festival", date: 1991.0718, eventLink: "https://en.wikipedia.org/wiki/Lollapalooza"),
    Event(description: "Nirvana’s \"Smells Like Teen Spirit\" is released", date: 1991.0912, eventLink: "https://en.wikipedia.org/wiki/Smells_Like_Teen_Spirit"),
    Event(description: "Sinead O’Connor tears up picture of the pope", date: 1992.1003, eventLink: "https://www.rollingstone.com/music/music-lists/the-25-boldest-career-moves-in-rock-history-150807/sinead-oconnor-tears-up-a-photo-of-the-pope-on-live-tv-155263/"),
    Event(description: "Rock and Roll Hall of Fame opens", date: 1995.0902, eventLink: "https://www.rockhall.com/visit/about-rock-hall"),
    Event(description: "Last Grateful Dead concert with Jerry Garcia", date: 1995.0909, eventLink: "http://time.com/3946460/grateful-dead-last-show-history/"),
    Event(description: "2Pac is murdered", date: 1996.0907, eventLink: "https://en.wikipedia.org/wiki/Murder_of_Tupac_Shakur"),
    Event(description: "Johnny Cash appears on \"The Simpsons\"", date: 1997.0105, eventLink: "https://en.wikipedia.org/wiki/El_Viaje_Misterioso_de_Nuestro_Jomer_(The_Mysterious_Voyage_of_Homer)"),
    Event(description: "Aretha Franklin fills in for Luciano Pavarotti at the Grammys", date: 1998.0225, eventLink: "https://www.billboard.com/articles/news/8470628/aretha-franklin-pavarotti-1998-grammys-nessun-dorma-ken-ehrlich"),
    Event(description: "Bob Dylan wins an Oscar", date: 2000.0226, eventLink: "https://www.rollingstone.com/movies/movie-news/dylan-wins-oscar-76603/"),
    Event(description: "The movie \"Almost Famous\" opens", date: 2000.0913, eventLink: "https://www.imdb.com/title/tt0181875/"),
    Event(description: "iTunes is released", date: 2001.0109, eventLink: "https://en.wikipedia.org/wiki/History_of_iTunes"),
    Event(description: "American Idol premieres", date: 2002.0611, eventLink: "https://en.wikipedia.org/wiki/American_Idol_(season_1)"),
    Event(description: "The song \"Seven Nation Army\" is released", date: 2003.0301, eventLink: "https://en.wikipedia.org/wiki/Seven_Nation_Army"),
    Event(description: "First Lollapalooza Festival in Chicago", date: 2005.0723, eventLink: "https://en.wikipedia.org/wiki/Lollapalooza"),
    Event(description: "Final episode of Soul Train airs", date: 2006.0325, eventLink: "https://en.wikipedia.org/wiki/Soul_Train"),
    Event(description: "The Police reunion tour begins", date: 2007.0528, eventLink: "https://en.wikipedia.org/wiki/The_Police_Reunion_Tour"),
    Event(description: "Led Zeppelin reunites at Ahmet Ertegun tribute concert", date: 2007.121, eventLink: "https://www.rollingstone.com/music/music-news/led-zeppelin-reunite-the-full-report-from-david-fricke-231828/")
]


var events: [Event] = []

func createRound() -> GameRound {
    var eventArray = GameRound(events: [])
    events = []
    events.append(contentsOf: allEvents)
    
    for _ in 1...4 {
        let indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        eventArray.events.append(events[indexOfSelectedEvent] )
        events.remove(at: indexOfSelectedEvent)
    }
    return eventArray
}




























































