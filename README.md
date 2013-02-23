This is my first ruby app. The purpose of the app is to take user input for artist/location and create ical files for concerts using Songkick's API. 

Current state:

Up-to date verson is presentation_code.rb

I've included pseudocode.rb to show my thought process before creating the Result class.

Refactored individual methods into one class. Each instance of the Result class includes a hash with all of the shows for a given artist in a given location. 

Current bugs:

Not all artist/location lookups retrieve correct results. Still working on a patch. 

To Do:

Refactor into multiple classes. Potentially 1 class for the API lookup, 1 for the creation of ical files and 1 for the user input
