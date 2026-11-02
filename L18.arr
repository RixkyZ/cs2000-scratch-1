use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv
# Book: title (string) -> author (string) -> # of pages (number)

# Chair: #legs (number) -> color (string) -> height adjustable? (boolean)

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

book1 = book("Harry Porter", "JK Rowling", 300)
book2 = book("The Hunger Games", "Suzanne Collins", 400)

fun b-s(b :: BookRecord) -> String:
  doc:"returns the summart of book when inputs"
  b.title + " " + "by" + " " + b.author + "," + " " + num-to-string(b.pages) + " " + "pages"

where:
  b-s(book2) is "The Hunger Games by Suzanne Collins, 400 pages"
  b-s(book1) is "Harry Porter by JK Rowling, 300 pages"
end

fun is-long-book(b :: BookRecord) -> Boolean:
  doc:"returns if a book has more than 350 pages or not"
   (b.pages) > 350
where:
is-long-book(book1) is false
is-long-book(book2) is true
end

data Podcast:
  | podcast(topic :: String, host :: String, episodes :: Number) 
end

podcast1 = podcast("AI", "Wang Lee", 1)
podcast2 = podcast("Music and Social Engagement", "Tyser", 5)
fun p-s(p :: Podcast) -> String:
  doc:"returns the summart of podcast when inputs"
  p.topic + " " + "host by" + " " + p.host + "," + " " + "Episode" + " " + num-to-string(p.episodes)
where:
p-s(podcast1) is "AI host by Wang Lee, Episode 1"
end

recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))

data Recipes:
  | recipe(title :: String, serving :: Number, prep-time :: Number)
end

fun row-to-recipies(row :: Row) -> Recipes:
  doc:" returns a recipes for the given row"
  recipe(
  get-column(row,"title"),
  get-column(row,"servings"),
  get-column(row,"prep-time")
    )
where:
  row-to-recipies(get-row(recipes,2)) is recipe("Avocado Toast", 2, 10)
end

build-column(recipes,"recipe data",row-to-recipies)
