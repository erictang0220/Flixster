# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step.

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

#### iPhone 8 Display:
<img src="https://user-images.githubusercontent.com/50003319/154859983-81487572-0dda-44c0-87f6-a950ca7b353c.gif" width=250><br>

####iPhone 13 Pro Max Display:
<img src="https://user-images.githubusercontent.com/50003319/154859987-82debbb2-4f8a-457a-9bb3-fb9f09992faa.gif" width=250><br>


### Notes
I was encountering problems with label not showing on multiple lines. I was able to fix it my resizing the label size. I also had the problem of not being able to fetch images with http and had to use https in the end. Lastly, I encountered problems when incorporating auto layout with tableview. The movie cells were cut in half, and I fixed it by setting the bottom margin of the poster and synopsis to be >= 10.
