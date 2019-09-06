#Attributes
A cocktail has a name (e.g. "Mint Julep", "Whiskey Sour", "Mojito")

An ingredient has a name (e.g. "lemon", "ice", "mint leaves")

A dose is the amount needed for each ingredient in a cocktail
(e.g. the Mojito cocktail needs 6cl of lemon).
So each dose references a cocktail, an ingredient and has a description.

#Validation
A cocktail must have a unique name.
An ingredient must have a unique name.
A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
#Associations
A cocktail has many doses
A cocktail has many ingredients through doses
An ingredient has many doses
A dose belongs to an ingredient
A dose belongs to a cocktail
You can't delete an ingredient if it used by at least one cocktail.
When you delete a cocktail, you should delete associated doses (but not the ingredients as they can be linked to other cocktails).
