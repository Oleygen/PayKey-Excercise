PayKey Exercise 

You will write an “imdb” like application using themoviedb API

Login into https://www.themoviedb.org/ api, an obtain an api key using:

The Movie Database API

Notes
    •    The exercise should take about 3 hours
    •    Don’t spend too much time on UI, make the app functional
    •    Code should be neat and self-explanatory
    •    You don't have to complete the entire app, submit what  you can do in ~3 hours

For Android
    •    Write in Java and Kotlin
    •    Third-party libraries are allowed (Gson, Image loading (Picasso, Glide), Networking, etc...)
    •    Rx Libraries are not allowed (RxJava, RxAndroid, etc..)

For iOS
    •    You can write in Swift or Objective C.
    •    Third-party libraries are not allowed (except networking)


Part 1:
Write an app that displays a list of the popular movies from themoviedb, display the first 5 pages (using paging when you scroll down)

https://api.themoviedb.org/3/movie/popular?api_key=<api_key>&language=en-US&page=1

for each movie display, it’s title, popularity, and poster

if a movie cell is clicked display a movie page containing data from the following query:

https://api.themoviedb.org/3/movie/<movie_id>?api_key=<api_key>&language=en-US
Part 2, Search:
In the main movie list screen add search functionality using: 

https://api.themoviedb.org/3/search/movie?api_key=<api-key>&language=en-US&query=<query_string>&page=1&include_adult=false

    •    Don’t use a search button (search while you type)
    •    Try to search efficiently
    •    Add support in paging 


