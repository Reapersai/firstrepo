package main

import (
	"fmt"
	"strings"
)

func main() {
	var conferenceName = "Go Conference"
	const conferenceTickets int = 50
	var remainingTickets uint = 50
	var bookings = []string{}

	fmt.Printf("Welcome to %v bookking application!\n", conferenceName)
	fmt.Printf("Get your tickets here to attend the %v !\n", conferenceName)
	fmt.Printf("Remember we have only %v Tickets for %v !\n", conferenceTickets, conferenceName)
	fmt.Printf("We have only %v left!\n\n", remainingTickets)

	for {
		var userName string
		var lastname string
		var email string
		var userTickets uint
		// Ask user for their name
		fmt.Println("Enter your name:- ")
		fmt.Scan(&userName)

		// Ask user for their last name
		fmt.Println("Enter your last name:- ")
		fmt.Scan(&lastname)

		// Ask user for their email
		fmt.Println("Enter your email:- ")
		fmt.Scan(&email)

		// Ask user for number of tickets they want
		fmt.Println("How many tickets do you want:- ")
		fmt.Scan(&userTickets)

		remainingTickets = remainingTickets - userTickets
		bookings = append(bookings, userName+" "+lastname)

		// Print a confirmation message
		fmt.Printf("Thank you %v for booking %v tickets!\n", userName, userTickets)
		fmt.Printf("A confirmation email will be sent to %v.\n", email)
		fmt.Printf("We have %v tickets remaining for %v!\n\n", remainingTickets, conferenceName)
		firstname := []string{}
		for _, bookking := range bookings {
			names := strings.Fields(bookking)
			firstname = append(firstname, names[0])
		}
		fmt.Printf("List of firstnames of the bookings is as follows:%v\n", firstname)
	}
}
