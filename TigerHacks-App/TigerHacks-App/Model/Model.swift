//
//  Model.swift
//  TigerHacks-App
//
//  Created by Jonah Zukosky on 3/9/18.
//  Copyright © 2018 Zukosky, Jonah. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    static var sharedInstance = Model()
    
    init() {
        
    }
    // Hex code for colors: FDFAE5
    
    var sponsors:[Sponsor]?
    var dayOneSchedule:[Event]?
    var dayTwoSchedule:[Event]?
    var dayThreeSchedule:[Event]?
    var beginnerPrizes:[Prize]?
    var mainPrizes:[Prize]?
    var resources:[Resource]?
    
    var fullSchedule:[Event]?
    
    func fakeAPICall(){
        
        //Schedule Dummy Data
        let myCalendar = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.day = 12
        dateComponents.hour = 20
        dateComponents.minute = 30
        var dateComponents1 = DateComponents()
        dateComponents1.day = 13
        dateComponents1.hour = 12
        dateComponents1.minute = 00
        var dateComponents2 = DateComponents()
        dateComponents2.day = 14
        dateComponents2.hour = 8
        dateComponents2.minute = 30
        var dateComponents3 = DateComponents()
        dateComponents3.day = 14
        dateComponents3.hour = 1
        dateComponents3.minute = 30
        var dateComponents4 = DateComponents()
        dateComponents4.day = 13
        dateComponents4.hour = 18
        dateComponents4.minute = 30
        
        dayOneSchedule = [Event(time: myCalendar.date(from: dateComponents)!,location: "Time Capsule",floor: 1, title: "Game Party",description: "Hanging out and playing games")]
        
        dayTwoSchedule = [Event(time: myCalendar.date(from: dateComponents1)!,location: "Time Capsule",floor: 1, title: "Lunch",description: "Hanging out and playing games"),
                          Event(time: myCalendar.date(from: dateComponents1)!,location: "Main Hallway",floor: 2, title: "Dinner",description: "Eating dinner"),
                          Event(time: myCalendar.date(from: dateComponents4)!,location: "Main Hallway",floor: 2, title: "Dinner",description: "Eating dinner")]
        
        dayThreeSchedule = [Event(time: myCalendar.date(from: dateComponents2)!,location: "The Closet",floor: 3, title: "Nothin",description: "Don't come"),
                            Event(time: myCalendar.date(from: dateComponents3)!,location: "The Closet",floor: 3, title: "Nothing happens on this floor I promise  Nothing happens on this floor I promise  Nothing happens on this floor I promise",description: "Don't come")]
        
        //Mentor Dunny Data
        
        var cernerMentors = [Mentor(name: <#T##String#>, skills: <#T##[String]?#>, contact: <#T##String?#>),
            Mentor(name: <#T##String#>, skills: <#T##[String]?#>, contact: <#T##String?#>)]
        var airbnbMentors = [Mentor(name: <#T##String#>, skills: <#T##[String]?#>, contact: <#T##String?#>),
            Mentor(name: <#T##String#>, skills: <#T##[String]?#>, contact: <#T##String?#>)]
        //Sponsor Dummy Data
        sponsors = [Sponsor(mentors: nil,
                                        name: "AirBnb",
                                        description: "we find homes that you can rent. Undercut the hotels",
                                        website: "airbnb.com",
                                        location: "Table 5, Main Hallway",
                                        image: UIImage(named:"airbnb")),
                                Sponsor(mentors: nil,
                                        name: "Cerner",
                                        description: "we make healthcare stuff that is good and makes people not die probably most of the time this just to get to a length of more than one line",
                                        website: "Cerner.com",
                                        location: "Table 6, Main Hallway",
                                        image: UIImage(named:"cerner")),
                                Sponsor(mentors: nil,
                                        name: "Google",
                                        description: "we google stuff all day",
                                        website: "google.com",
                                        location: "Table 7, Main Hallway",
                                        image: UIImage(named:"google")),
                                Sponsor(mentors: nil,
                                        name: "Pied Piper",
                                        description: "Compression software haha relevant topical joke software",
                                        website: "There is no website",
                                        location: "Table 8, Main Hallway",
                                        image: UIImage(named:"piedpiper")),
                                Sponsor(mentors: nil,
                                        name: "Microsoft",
                                        description: "we bing stuff all day",
                                        website: "bing.com",
                                        location: "Table 9, Main Hallway",
                                        image: UIImage(named:"microsoft")),
                                Sponsor(mentors: nil,
                                        name: "FulcrumGT",
                                        description: nil,
                                        website: nil,
                                        location: nil,
                                        image: nil),
                                Sponsor(mentors: nil,
                                        name: "Fulcrum GT",
                                        description: "DOGFOOD GOES TO THE MARKET, YOU WALKED IT THERE, YOU'RE KILLIN IT YOU YOUNG ENTREPRENEUR. NOBODY HAS A .ORG NOT EVEN US",
                                        website: "dogfood.org",
                                        location: "Table 10, Main Hallway",
                                        image: UIImage(named:"fulcrumgt")),
                                Sponsor(mentors: nil,
                                        name: "Fulcrum GT",
                                        description: "DOGFOOD GOES TO THE MARKET, YOU WALKED IT THERE, YOU'RE KILLIN IT YOU YOUNG ENTREPRENEUR. NOBODY HAS A .ORG NOT EVEN US",
                                        website: "dogfood.org",
                                        location: "Table 10, Main Hallway",
                                        image: UIImage(named:"fulcrumgt")),
                                Sponsor(mentors: nil,
                                        name: "Fulcrum GT",
                                        description: "DOGFOOD GOES TO THE MARKET, YOU WALKED IT THERE, YOU'RE KILLIN IT YOU YOUNG ENTREPRENEUR. NOBODY HAS A .ORG NOT EVEN US",
                                        website: "dogfood.org",
                                        location: "Table 10, Main Hallway",
                                        image: UIImage(named:"fulcrumgt")),
                                Sponsor(mentors: nil,
                                        name: "Fulcrum GT",
                                        description: "DOGFOOD GOES TO THE MARKET, YOU WALKED IT THERE, YOU'RE KILLIN IT YOU YOUNG ENTREPRENEUR. NOBODY HAS A .ORG NOT EVEN US",
                                        website: "dogfood.org",
                                        location: "Table 10, Main Hallway",
                                        image: UIImage(named:"fulcrumgt"))]
        //Prize Dummy Data
        beginnerPrizes = [
            Prize(sponsor: Sponsor(mentors: nil,name: "Cerner",description: "we make healthcare stuff that is good and makes people not die probably most of the time this just to get to a length of more than one line",website: "Cerner.com",location: "Table 6, Main Hallway",image:nil),
                  title: "Beginner Prize",
                  reward: "Nothing",
                  description: "This prize is awarded to the hack that best encompasses Cerner's mission statement to make the world a worse place for developers",
                  prizeType: PrizeType.beginner),
            Prize(sponsor: Sponsor(mentors: nil,name: "Cerner",description: "we make healthcare stuff that is good and makes people not die probably most of the time this just to get to a length of more than one line",website: "Cerner.com",location: "Table 6, Main Hallway",image:nil),
                  title: "Beginner Prize",
                  reward: "Something",
                  description: "This prize is awarded to the hack that best encompasses Cerner's mission statement to make the world a worse place for developers",
                  prizeType: PrizeType.beginner)]
        
        mainPrizes = [
            Prize(sponsor: Sponsor(mentors: nil,name: "Cerner",description: "we make healthcare stuff that is good and makes people not die probably most of the time this just to get to a length of more than one line",website: "Cerner.com",location: "Table 6, Main Hallway",image:nil),
                  title: "Make the World Better for us",
                  reward: "4 trips to a Cerner sponsored hospital facility",
                  description: "This prize is awarded to the hack that best encompasses Cerner's mission statement to make the world a worse place for developers",
                  prizeType: PrizeType.main),
            Prize(sponsor: Sponsor(mentors: nil,name: "RJI",description: "we write articles blah blah blah",website: "Cerner.com",location: "Table 7, Main Hallway",image:nil),
                  title: "Do Something for the J-School",
                  reward: "A big ol' drone",
                  description: "You better do this one",
                  prizeType: PrizeType.main),
            Prize(sponsor: Sponsor(mentors: nil,name: "Google",description: "we google stuff but really its just bing",website: "google.com/careers",location: "Table 99, Main Hallway",image:nil),
                  title: "Snooping For Google",
                  reward: "A google home wink wink",
                  description: "This prize is awarded to the hack that best encompasses Google's mission statement to farm as much information about literally everyone",
                  prizeType: PrizeType.main),
            Prize(sponsor: Sponsor(mentors: nil,name: "Microsoft",description: "we search stuff but also computers. Really everything",website: "microsoft.com/careers",location: "Table 10, Main Hallway",image:nil),
                  title: "Figure out PageRank",
                  reward: "We'll hire you",
                  description: "This prize is awarded to the hack that best figures out how the hell Google is ranking all those pages",
                  prizeType: PrizeType.main)]
        
        //Resource Dummy Data
        resources = [Resource(url: "https://www.google.com", title: "Google", description: "It's a website for googling things that you should use probably a whole lot."),Resource(url: "https://www.bing.com", title: "Bing", description: "It's a website for binging things that you should use probably not a whole lot."),Resource(url: "https://www.yahoo.com", title: "Yahoo", description: "It's a website for yahooing (sp?) things that you should use probably not a whole lot."),Resource(url: "https://www.youtube.com/embed/RmHqOSrkZnk", title: "Embedding Videos into a WebView Tutorial", description: "Tutorial for embedding youtube videos into an iOS app. ")]
        
        //Map Dummy Data
        fullSchedule = [Event(time: myCalendar.date(from: dateComponents)!,location: "Time Capsule",floor: 1, title: "Game Party",description: "Hanging out and playing games"),Event(time: myCalendar.date(from: dateComponents1)!,location: "Time Capsule",floor: 1, title: "Lunch",description: "Hanging out and playing games"),
                        Event(time: myCalendar.date(from: dateComponents1)!,location: "Main Hallway",floor: 2, title: "Dinner",description: "Eating dinner"),
                        Event(time: myCalendar.date(from: dateComponents4)!,location: "Main Hallway",floor: 2, title: "Dinner",description: "Eating dinner"),Event(time: myCalendar.date(from: dateComponents2)!,location: "The Closet",floor: 3, title: "Nothin",description: "Don't come"),
                        Event(time: myCalendar.date(from: dateComponents3)!,location: "The Closet",floor: 3, title: "Nothing happens on this floor I promise  Nothing happens on this floor I promise  Nothing happens on this floor I promise",description: "Don't come")]
        
    }
    
    
}
