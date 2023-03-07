import os
import ast
import mysql.connector
from mysql.connector import Error
from flask import Flask, render_template, request, flash, redirect, url_for

IMG_UPLOAD_FOLDER = 'static'
IMG_ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

app = Flask(__name__)
app.secret_key = "secret key"
app.config['UPLOAD_FOLDER'] = IMG_UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024


try:
    connection = mysql.connector.connect(host=os.getenv('MYSQL_HOST'),
                                         database=os.getenv('MYSQL_DB_NAME'),
                                         user=os.getenv('MYSQL_USER'),
                                         password=os.getenv('MYSQL_PASSWD')
                                         )

    if connection.is_connected():
        cursor = connection.cursor()

except Error as e:
    print(e)


@app.route("/")
def display_images():
    cursor.execute("SELECT images.image_path, recipes.recipe_name, recipes.recipe_id \
                    FROM recipes \
                    INNER JOIN images \
                    ON images.recipe_id = recipes.recipe_id")
    records = cursor.fetchall()
    recipes = []
    for record in records:
        recipes.append(
            {'id': record[2], 'img_path': record[0], 'recipe_name': record[1]})
    return render_template('home.html', recipes=recipes)


@app.route("/recipe/<id>")
def display_specific_recipe(id):
    recipe_id = id
    cursor.execute("SELECT recipes.recipe_name, images.image_path \
                    FROM recipes \
                    INNER JOIN images \
                    ON recipes.recipe_id=images.recipe_id \
                    WHERE recipes.recipe_id=%s", (id,))
    recipe = cursor.fetchone()
    recipe_name = recipe[0]
    img_path = recipe[1]

    cursor.execute("SELECT ingredient \
                    FROM ingredients \
                    WHERE recipe_id=%s",(id,))

    records = cursor.fetchall()
    ingredients = []
    for record in records:
        ingredients.append(record[0])
    
    cursor.execute("SELECT step_name, step \
                    FROM steps \
                    WHERE recipe_id=%s",(id,))

    records = cursor.fetchall()
    steps = []
    for record in records:
        steps.append({'step_name': record[0], 'step': record[1]})

    return render_template('recipe.html', recipe=recipe_name, ingredients=ingredients, steps=steps, img_path=img_path, recipe_id=recipe_id)


@app.route("/categories/<id>")
def category(id):
    cursor.execute("SELECT images.image_path, recipes.recipe_name, recipes.recipe_id, recipes.category_id \
                    FROM recipes \
                    INNER JOIN images ON images.recipe_id = recipes.recipe_id \
                    WHERE recipes.category_id=%s", (id,))
    records = cursor.fetchall()
    recipes = []
    for record in records:
        recipes.append({'id': record[2], 'img_path': record[0],
                       'recipe_name': record[1], 'category': record[3]})

    cursor.execute("SELECT category \
                    FROM categories \
                    WHERE category_id=%s", (id,))
    category = cursor.fetchone()
    return render_template('category.html', recipes=recipes, category=category[0])


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in IMG_ALLOWED_EXTENSIONS


@app.route("/add", methods=('GET', 'POST'))
def add():
    if request.method == 'POST':

        recipe_name = request.form['recipe_name']
        category = request.form['category']
        img = request.files['file']
        ingredients = []
        steps = {}

        for field in request.form:
            print(field)
            if 'ingredient' in field:
                ingredients.append(request.form[field])
            if 'stepname' in field:
                step_name = request.form[field]
                step = field.split('_')[1]
                step = request.form['step_'+ step]
                steps[step_name] = step

        cursor.execute("SELECT recipe_id \
                        FROM recipes \
                        WHERE recipe_name=%s", (recipe_name,))
        recipes = cursor.fetchall()

        if not recipes:

            if ingredients and steps and allowed_file(img.filename):
                cursor.execute("INSERT INTO recipes (recipe_name, category_id) \
                                VALUES (%s,%s)", (recipe_name, category,))
                connection.commit()
                recipe_id = cursor.lastrowid
    
                for ingredient in ingredients:
                    cursor.execute("INSERT INTO ingredients (recipe_id,ingredient) \
                                    VALUES (%s,%s)", (recipe_id, ingredient,))
                    connection.commit()
                 
                for step_key in steps:
                    cursor.execute("INSERT INTO steps (recipe_id, step_name, step) \
                                    VALUES (%s,%s,%s)", (recipe_id, step_key, steps[step_key],))
                    connection.commit()

                img_path = os.path.join(
                    app.config['UPLOAD_FOLDER'], img.filename)
                print(img_path)
                img.save(img_path)
                img_path='/'+img_path
                cursor.execute("INSERT INTO images (recipe_id, image_path)\
                                VALUES (%s,%s)", (recipe_id, img_path))
                connection.commit()

                flash('Przepis dodany')
                return redirect('/')

            elif not allowed_file(img.filename):
                flash('Dozwolony typ pliku: png, jpg, jpeg!')

            else:
                flash('Niepełny formularz. Dodaj składniki/kroki!')

        else:
            flash('Przepis o tej nazwie już istnieje, wybierz inną nazwę')

    return render_template('add_recipe.html')


@app.route("/delete/", methods=('GET', 'POST'))
def delete_recipe():
    if request.method == 'POST':
        id = request.form['delete']

        cursor.execute('SELECT image_path \
                        FROM images \
                        WHERE recipe_id=%s', (id,))
        image_path = cursor.fetchone()[0]

        cursor.execute('DELETE FROM recipes \
                        WHERE recipe_id=%s', (id,))
        connection.commit()

        cursor.execute('SELECT image_id \
                        FROM images \
                        WHERE image_path=%s', (image_path,))
        img_duplicate = cursor.fetchall()

        if os.path.exists(str(image_path[1:])) and len(img_duplicate) == 0:
            os.remove(str(image_path[1:]))
        else:
            print(image_path[1:])

    flash('Przepis usunięty')
    return redirect('/')


if __name__ == "__main__":
    app.run()
