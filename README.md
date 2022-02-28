# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF
#### Required Features:
<img src="https://user-images.githubusercontent.com/50003319/155930807-6b27e88e-b0e1-438a-8ab4-9a85089c828d.gif" width=250><br>

#### Bonus Features:
<img src="https://user-images.githubusercontent.com/50003319/155930800-d3c7b524-33b5-4f30-a6f6-f92528229599.gif" width=250><br>

### Notes
I was struggling to link the poster view to its trailer. It turned out that I didn't check "User interaction enabled" for the poster image view. Also, I forgot to click on the yellow square/circle to name the custom classes in the storyboard sometimes. This can cause items to not be linked properly.  

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthrough GIF

#### iPhone 8 Portrait Display:
<img src="https://user-images.githubusercontent.com/50003319/154859983-81487572-0dda-44c0-87f6-a950ca7b353c.gif" width=250><br>

#### iPhone 13 Pro Max Portrait Display:
<img src="https://user-images.githubusercontent.com/50003319/154859987-82debbb2-4f8a-457a-9bb3-fb9f09992faa.gif" width=250><br>

#### iPhone 13 Pro Max Landscape Display:
<img src="https://user-images.githubusercontent.com/50003319/155856317-a820eece-1cd4-4c0c-916f-a55910ee5efd.gif" height=250><br>


### Notes
I was encountering problems with label not showing on multiple lines. I was able to fix it my resizing the label size. I also had the problem of not being able to fetch images with http and had to use https in the end. Lastly, I encountered problems when incorporating auto layout with tableview. The movie cells were cut in half, and I fixed it by setting the bottom margin of the poster and synopsis to be >= 10.
