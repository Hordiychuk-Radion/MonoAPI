# MonoAPI


Hello, guests
I would like to introduce you to my project Monobank API. 

Step 1. In order to pull transactions from monobank through my script, you first need to create a table in SQL SERVER with all the necessary columns, you can find it in a file called 'MONO.sql', then we can use the script 'mono.py' substituting our data, run it and monobank sends us its transaction data through the API.
  ![sql result](https://github.com/Hordiychuk-Radion/MonoAPI/assets/139583782/3707c7af-e7bd-49c9-8012-3c46decf11ba)

Step 2 For a better understanding of which categories the money goes to, we need to make some changes to our table, we need to use the json from the hit hub where the mcc code and categories are located, and we need to write this json to the sql table, you will find the code for this under the name 'JSON.sql', I also drop the link to JSON.
https://github.com/Oleksios/Merchant-Category-Codes/blob/main/With%20groups/mcc-en.json
Next, we need to make a join on mcc and add a short description column to understand what categories the transactions are in. You can find the code in the file - 'MONO.sql'
![JSON RESULT](https://github.com/Hordiychuk-Radion/MonoAPI/assets/139583782/e37ce817-5724-43b3-95c9-162967a557a4)

Step 3. Next, we need to connect power bi to make a cost chart, cost matrix, cost trend and more.
Step 4. We will modify the code so that the script adds only new data in the future. You can see and use the code under the name 'mono_update.py
I also attach the results of my work.
![m update result](https://github.com/Hordiychuk-Radion/MonoAPI/assets/139583782/96ad6799-42cc-4f9d-bc2b-564fb6f73552)

![power bi](https://github.com/Hordiychuk-Radion/MonoAPI/assets/139583782/398e20d2-f7ee-406c-a0a9-774c8065d2b0)

