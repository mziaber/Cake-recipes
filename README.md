# Cake recipes

Web app made to store cakes recipes, allows CRUD opartions on database.

## Prerequirements
* MySQL database server
* Python 

## Installation
* import Cakes.sql to MySQL database server
```
pip install -r requirements.txt
IMG_FOLDER_PATH=/img_folder MYSQL_HOST=localhost MYSQL_DB_NAME=Cakes MYSQL_USER=root MYSQL_PASSWD=root python3 cake_recipes.py 
```

## Used frameworks / tools
* Flask
* MySQL
* Bootstrap

## Example usage screenshots

### Home page
![alt text](https://github.com/mziaber/Cake-recipes/blob/main/screenshots/home_page.png?raw=true)

### Recipe view
![alt text](https://github.com/mziaber/Cake-recipes/blob/main/screenshots/recipe.png?raw=true)

### Deleting recipe
![alt text](https://github.com/mziaber/Cake-recipes/blob/main/screenshots/delete_recipe.png?raw=true)

### Adding new recipe
![alt text](https://github.com/mziaber/Cake-recipes/blob/main/screenshots/add_recipe.png?raw=true)

Made by: Magdalena Ziąber