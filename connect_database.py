import os
import ast
import mysql.connector
from mysql.connector import Error
from werkzeug.utils import secure_filename
from flask import Flask, render_template, request, flash, redirect, url_for

IMG_UPLOAD_FOLDER = '/home/magda/Cake-recipes/static'
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
    cursor.execute("SELECT recipes.recipe_name, recipes.ingridients_list, recipes.steps_list, images.image_path, recipes.recipe_id FROM recipes INNER JOIN images ON recipes.recipe_id=images.recipe_id WHERE recipes.recipe_id=%s", (id,))
    recipe=cursor.fetchone()
    recipe_name = recipe[0]
    ingridients_ids = ast.literal_eval(recipe[1])
    steps_ids = ast.literal_eval(recipe[2])
    img_path = recipe[3]
    recipe_id = recipe[4]

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

    return render_template('recipe.html', recipe=recipe_name, ingridients=ingridients, steps=steps, img_path=img_path, recipe_id=recipe_id)

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
        img = request.files['file']
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

        if ingridients and steps and allowed_file(img.filename):

            for ingridient in ingridients:
                cursor.execute("INSERT INTO ingridients \
                                VALUES (NULL,%s)", (ingridient,))
                connection.commit()
                cursor.execute("SELECT ingridient_id FROM ingridients WHERE ingridient=%s ORDER BY ingridient_id DESC;", (ingridient,))
                ingridient_ids.append(cursor.fetchall()[0][0]) 

            for step_key in steps:
                cursor.execute("INSERT INTO steps \
                                VALUES (NULL,%s,%s)", (step_key, steps[step_key]))
                connection.commit()
                cursor.execute("SELECT step_id FROM steps WHERE step_name=%s ORDER BY step_id DESC;", (step_key,))
                step_ids.append(cursor.fetchall()[0][0]) 

                cursor.execute("INSERT INTO recipes VALUES (NULL,%s,%s,%s,%s)", (recipe_name, str(ingridient_ids), str(step_ids), category,))
                connection.commit()

                cursor.execute("SELECT recipe_id FROM recipes WHERE recipe_name=%s", (recipe_name,))
                recipe_id = cursor.fetchone()[0]

            img_name = secure_filename(img.filename)
            img_path = os.path.join(app.config['UPLOAD_FOLDER'], img_name)
            img.save(img_path)
            img_path=img_path.split('Cake-recipes')[1]
            cursor.execute("INSERT INTO images VALUES (NULL, %s,%s)", (recipe_id, img_path))
            connection.commit()

            flash('Przepis dodany')
            redirect('/')

        elif not allowed_file(img.filename):
            flash('Dozwolony typ pliku: png, jpg, jpeg!')
        
        else:
            flash('Niepełny formularz. Dodaj składniki/kroki!')
       
    
    return render_template('add_recipe.html')


@app.route("/delete/", methods=('GET','POST'))
def delete_recipe():
    if request.method == 'POST':
        id = request.form['delete']
       
        cursor.execute("SELECT ingridients_list, steps_list FROM recipes WHERE recipe_id=%s", (id,))
        recipe=cursor.fetchone()
        ingridients_ids = ast.literal_eval(recipe[0])
        steps_ids = ast.literal_eval(recipe[1])

        for ingridient_id in ingridients_ids:
            cursor.execute('DELETE FROM ingridients WHERE ingridient_id=%s', (ingridient_id,))
            connection.commit()

        for step_id in steps_ids:
            cursor.execute('DELETE FROM steps WHERE step_id=%s', (step_id,))
            connection.commit()

        cursor.execute('DELETE FROM recipes WHERE recipe_id=%s', (id,))
        connection.commit()

        cursor.execute('SELECT image_path FROM images WHERE recipe_id=%s',(id,))
        image_path=cursor.fetchone()[0]

        if os.path.exists(str(image_path[1:])):
            os.remove(str(image_path[1:]))
        else:
            print(image_path[1:])
        
        cursor.execute('DELETE FROM images WHERE recipe_id=%s', (id,))
        connection.commit()
    
    flash('Przepis usunięty')
    return redirect('/')
         

if __name__ == "__main__":
    app.run()
