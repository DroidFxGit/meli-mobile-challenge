# MELI Mobile Challenge

### Clonning the project

- In your console, run the following commands:

```
git clone https://github.com/DroidFxGit/meli-mobile-challenge.git
```

- once is Done, go to the project:

```
cd meli-mobile-challenge
```

Then execute `MercadoLibre.xcodeproj`


### Arquitecture

Components Overview and their roles:

- *View:* additional layer that has implemented all the UI components programattically
- *ViewController:* It only performs things related to UI — Show/get information. Part of the view layer
- View Model:* It receives information from VC, handles all this information, and sends it back to VC.
- *Model:* It is used to store and updates information received by the webservices


### Features

- Home Module: Presents a search bar where you can write whatever product you want to find

![Simulator Screen Shot - iPhone 12 mini - 2022-01-24 at 21 10 45](https://user-images.githubusercontent.com/6626352/150904198-a9e875eb-2502-4860-b2ce-b395992ecfbd.png)



- Results section: Shows a list of the 15 relevant products related with your search

![Simulator Screen Shot - iPhone 12 mini - 2022-01-24 at 20 56 00](https://user-images.githubusercontent.com/6626352/150904234-5dc877f2-86eb-4888-95e5-840d69cd22e5.png)



- Detail section: Shows some of the most relevant details of the product, such as images, price, description and features.

![Simulator Screen Shot - iPhone 12 mini - 2022-01-24 at 20 56 16](https://user-images.githubusercontent.com/6626352/150904264-198db3e8-834d-413c-a4c9-2b7568307e96.png)



- Also supports ipad devices resolution

![Simulator Screen Shot - iPad mini (6th generation) - 2022-01-24 at 20 52 17](https://user-images.githubusercontent.com/6626352/150904378-0827363f-25a5-4b08-a514-d2230a8b4d0a.png)


