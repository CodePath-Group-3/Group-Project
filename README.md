# Tinder App for Movies

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
The purpose of this app is to make a Tinder version for movies where the user can give a thumbs up/thumbs down on a recommended movie. 

### App Evaluation
- **Category:** Entertainment, content-generator
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer.
- **Story:** 
- Analyzes users choices, then the app generates movies based on users "thumbs up" list.
- **Market:** 
- Streaming content consumers, 17+
- **Habit:** 
- User can utilize the app as much as they want, but the more they use it, the better the app will generate recommendations closer to the user's liking.
- **Scope:** 
- Recommend movies based on what users like. Recommendations could be enhanced by using machine learning.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**
• User is able to login/logout
• User is able to thumbs up/thumbs down a movie recommended (like Tinder)
• A movie poster pops on every recommendation (like tinder)
• Generates a list of recommended movies based on what the user liked

**Optional Nice-to-have Stories**
• Link to the movie trailer when the user taps the movie poster
• User can create a profile
• Shows summary and rating on detail view
• Social interaction functionality

### 2. Screen Archetypes

* Login
* Register - User logs in or signs up in the app
* A movie poster will be the first thing the user sees
    * User can start liking or disliking a move (Tinder style)
* Two separate screen of collections that a user can see: A collection of what the user has liked and a collection of recommnded movies

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Movies selection
* Movies Liked
* Movies Recommended

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> Account creation if no log in is available
* Movies Selection -> (Add movies to "Liked lists")
* Liked Movies -> Collection View
* Discover Movies -> Collection View

## Wireframes

<img src="https://user-images.githubusercontent.com/100539328/197395807-53283671-4453-429d-a4ba-f8f00ce963fb.jpg" width=800><br>

### [BONUS] Digital Wireframes & Mockups
<img src="[img here]" height=200>

### [BONUS] Interactive Prototype
<img src="[img here]" width=200>

## SCHEMA

### Data Models

![data-models](https://user-images.githubusercontent.com/100539328/197395419-f10f2543-f761-4480-94e6-a4191e51948e.png)

### Networking

List of network requests by screen:

Login View
- (Read/GET) Check if user is logged in
- (Create/POST) Create new user

Home Page
- (Create/POST) Create a new like on the post
- (Read/GET) Check if liked is true/false
- (Read/GET) Movie/show poster
- (Update/PUT) Update liked

Liked Page
- (Read/GET) List of all liked movies
- (Delete) Remove a movie/show from liked list

Recommended Page
- (Read/GET) List of all recommended movies

Detail View Page
- (Read/GET) Movie/show poster
- (Read/GET) Movie/show background image
- (Read/GET) Movie/show synopsis
- (Read/GET) Movie/show rating

Trailer View Page
- (Read/GET) Movie/show trailer

Gif of Currently Working App:
![](https://i.imgur.com/F7QUlFL.gif)
