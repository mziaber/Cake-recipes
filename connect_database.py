import os
import ast
import mysql.connector
from mysql.connector import Error
from werkzeug.utils import secure_filename
from flask import Flask, render_template, request, flash, redirect, url_for

IMG_UPLOAD_FOLDER = '/home/magda/Cake-recipes/img'
IMG_ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

app=Flask(__name__)
app.secret_key = "secret key"
app.config['UPLOAD_FOLDER'] = IMG_UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024


try: 
    connection = mysql.connector.connect(host='172.17.0.2',
                                         database='Cakes', 
                                         user='root', 
                                         password='madzia123')

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

def allowed_file(filename):
	return '.' in filename and filename.rsplit('.', 1)[1].lower() in IMG_ALLOWED_EXTENSIONS

@app.route("/add", methods=('GET','POST'))
def add():
    if request.method=='POST':
        recipe_name = request.form['recipe_name']
        category = request.form['category']
        ingridients=[]
        steps = {}
        for field in request.form:
            if 'ingridient' in field:
                ingridients.append(request.form[field])
            if 'stepname' in field:
                step_name = request.form[field]
                step = field.split('_')[1]
                step = request.form['step_'+step]
                steps[step_name]=step

        ingridient_ids = []
        step_ids = []

        for ingridient in ingridients:
            cursor.execute("INSERT INTO ingridients \
                            VALUES (NULL,%s)", (ingridient,))
            connection.commit()
            cursor.execute("SELECT ingridient_id FROM ingridients WHERE ingridient=%s", (ingridient,))
            ingridient_ids.append(cursor.fetchone()[0]) 
        print(ingridient_ids)

        for step_key in steps:
            cursor.execute("INSERT INTO steps \
                            VALUES (NULL,%s,%s)", (step_key, steps[step_key]))
            connection.commit()
            cursor.execute("SELECT step_id FROM steps WHERE step_name=%s", (step_key,))
            step_ids.append(cursor.fetchone()[0]) 
        print(step_ids)

        img = request.files['file']
        if img.filename == '':
            flash('No image selected')
            return redirect(request.url)

        if img and allowed_file(img.filename):
            img_name = secure_filename(img.filename)
            img_path = os.path.join(app.config['UPLOAD_FOLDER'], img_name)
            img.save(img_path)
            flash('Image successfully uploaded and displayed below')
        else:
            flash('Allowed image types are -> png, jpg, jpeg, gif')
            return redirect(request.url)


    return render_template('add_recipe.html')

if __name__ == "__main__":
    app.run()
