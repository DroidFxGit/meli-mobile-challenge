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
- Results section: Shows a list of the 15 relevant products related with your search
- Detail section: Shows some of the most relevant details of the product, such as images, price, description and features.
