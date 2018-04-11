Swift Chat (OSU CSE 3461) README
by Jon Reed

--- About ---

This project submission is an iPhone instant messenger application, written in Swift.
In the project folder (called SwiftChat) you will find the Podfile (or dependency file)
as well as the project itself contained in the SwiftChat folder. The project is comprised of several .swift files,
a few of which define data objects used to represent users of the application, and message payloads, as well as .swift files
that define each UI view within the application. All the swift files are organized into folders which describe their purpose.

--- Running the application ---

To run and test this application, a Mac with Mac OS High Sierra and the newest version of Xcode are required.
Furthermore, an Apple developer license is required to deploy the application to an iOS device. To open the project in Xcode for evaluation,
double click on the SwiftChat.xcworkspace file in the project folder.

Since the grader for this project likely will not have this setup, I have made arrangements to demo the project to the instructor on Tuesday, March 6th.

--- Using the application ---

Before using the app, please ensure that you have a working internet connection (via WIFI or cellular).

When the app starts, the user is prompted with a login or register selector. To create a user, select register and type in the display name, email, and password. Note that passwords must be at least 6 characters long. If some error occurs or the password is too short, alert messages are displayed via the UI to the user. If Firebase cannot register the user, the appropriate alert will be displayed. 
Once the user is created, they are brought to a view of their messages. To compose a message, press the button in the top right. Next select the recipient, and type your message below. 
Once sent, the message will be stored persistently in a realtime database. Note that since the database is realtime, as soon as a user is sent a message, their client will receive it should they be logged in. If they are not logged in, they will see it as soon as their client connects.

To see all online users, press the users button on the tab bar on the bottom of the screen. Online users appear first, and offline users appear last. 

--- Implementation details --- 

This application makes use of the Google Firebase Realtime Database and Authentication services and their respective APIs.
User accounts are created and logged into via implementation of Firebase authentication services API, and once each user is authenticated, their account is registered in a realtime database.
The GoogleService-Info.plist file contains application specific data such as the API key to connect to the database, and the application uses this file to make a connection and changes to the database. 

The AppDelegate.swift file contains the initial Firebase API setup code, as well as functions which are called on application start and termination.

The Data Objects folder contains implementations of the User and Message payload objects.

In the Views folder, there are 3 enclosed folders: Controllers, Table, and Table Cells.

The Controllers folder contains implementations of each page of the application that isn't a fully populated table, such as login, compose view, and chat log (which is a collection view). 
The Table folder contains the implementation for the Online Users section, as well as the view for the table of chats between users. 
Finally, in the Table Cells section, there are two .swift files, each of which define properties of table cells (one for Users, and the other for each specific chat message). 

The respective payload formats and Firebase connect functions for sending and observing messages are contained within their respective Swift source files. 

Each file is documented and should be fairly straightforward to comprehend thanks to the readability of Swift. Note that Swift is a weakly typed language. The 'var' keyword defines a mutable variable, while the 'let' keyword defines a constant. Type is not required in variable declarations, but is required when returning from a function or casting. 

--- Contact --- 

If you have any further questions about the source code (which is commented) or implementation and function, please feel free to email me at reed.1325@osu.edu.

Thank you for reading.