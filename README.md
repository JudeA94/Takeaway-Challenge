# Solo Project - Takeaway Challenge

## Challenge Description

Here is a project to test your golden square skills overall:

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of
that? How will you keep that information out of your repository?
  
## Project Description
  
This project uses multiple interacting classes that allow a user to:  
> Create dishes  
> Dishes have a name, description, price and category (such as starter, main, etc)  
>   
> Create a menu out of the dishes that have been created  
> Menus can -add/remove dishes  
>           -be viewed one category at a time  
>           -be viewed sorted by category  
>   
> Create orders out the dishes that have been created  
> Orders can -have dishes added/removed (multiple dishes at a time)  
>             -be viewd, including the quantity of each item  
>   
> Create a receipt based on an order  
> Receipts can -show the user an itemised receipt including each items cost, service charge, and total cost  
>              -allow the user to adjust the service charge percentage  
>              -confirm an order, creating a text  
>   
> Text a customer to confirm their order and delivery time  
>   
> For an example user experience use ruby run.rb  
> To use the text service, replace the environment variables ascociated with the Twilio account, and the recievers phone number.  
