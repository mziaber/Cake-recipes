import ast
import mysql.connector
from mysql.connector import Error
from flask import Flask, render_template, request

app=Flask(__name__)

try: 
    connection = mysql.connector.connect(host='172.17.0.2',
                                         database='Cakes', 
                                         user='root', 
                                         password='')

    if connection.is_connected():
        cursor = connection.cursor()       

except Error as e:
    print(e)

@app.route("/")
def display_images():
    cursor.execute("SELECT images.image_path, recipes.recipe_name, recipes.recipe_id FROM recipes INNER JOIN images ON images.recipe_id = recipes.recipe_id")
    records = cursor.fetchall()
    recipes = []
    for record in records:
        recipes.append({'id':record[2], 'img_path':record[0], 'recipe_name':record[1]})
    return render_template('home.html', recipes=recipes)


@app.route("/recipe/<id>")
def display_specific_recipe(id):
    cursor.execute("SELECT recipes.recipe_name, recipes.ingridients_list, recipes.steps_list, images.image_path FROM recipes INNER JOIN images ON recipes.recipe_id=images.recipe_id WHERE recipes.recipe_id=%s", (id,))
    recipe=cursor.fetchone()
    recipe_name = recipe[0]
    ingridients_ids = ast.literal_eval(recipe[1])
    steps_ids = ast.literal_eval(recipe[2])
    img_path = recipe[3]

    steps = []

    for step_id in steps_ids:
        cursor.execute("SELECT step,step_name FROM steps WHERE step_id=%s", (step_id,))
        step = cursor.fetchone()
        steps.append({'step_name':step[1], 'step':step[0]})

    ingridients = []

    for ingridient_id in ingridients_ids:
        cursor.execute("SELECT ingridient FROM ingridients WHERE ingridient_id=%s",(ingridient_id,))
        ingridient = cursor.fetchone()
        ingridients.append(ingridient[0])

    return render_template('recipe.html', recipe=recipe_name, ingridients=ingridients, steps=steps, img_path=img_path)

@app.route("/categories/<id>")
def category(id):
    cursor.execute("SELECT images.image_path, recipes.recipe_name, recipes.recipe_id, recipes.category_id \
                    FROM recipes \
                    INNER JOIN images ON images.recipe_id = recipes.recipe_id \
                    WHERE recipes.category_id=%s", (id,))
    records = cursor.fetchall()
    recipes = []
    for record in records:
        recipes.append({'id':record[2], 'img_path':record[0], 'recipe_name':record[1], 'category':record[3]})

    cursor.execute("SELECT category FROM categories WHERE category_id=%s",(id,))
    category = cursor.fetchone()
    return render_template('category.html', recipes=recipes, category=category[0])
    
@app.route("/add")
def add():
    return render_template('add_recipe.html')

if __name__ == "__main__":
    app.run()
