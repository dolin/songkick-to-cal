This is my first ruby app. The purpose of the app is to take user input for artist/location and create ical files for concerts using Songkick's API. 

Current state:

Up-to date verson is songkick-to-cal.rb. I've replaced my API key with 'Your API key' in certain places

Pseudocode.rb is included to show my thought process before writing the code.

Refactored individual methods into one class. Each instance of the Result class includes a hash with all of the shows for a given artist in a given location.  

To Do:

Refactor into multiple classes. Potentially 1 class for the API lookup, 1 for the creation of ical files and 1 for the user input

Working Example (if you have an API key):

$ ruby songkick-to-cal.rb

"What artist are you looking for?"

Beyonce

"Where are you located?"

New York City

"Your Beyonce shows have been created in your current directory. Rock on."