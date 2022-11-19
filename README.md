# KCLHack
KCL Hackathon Project

https://www.figma.com/file/9db19YlFcuJqxFcYEHkWNQ/King's-Hack?node-id=0%3A1&t=I4iyhXR9t2Ag7Gm5-0

<ins>The Machine Learning Model</ins>

We extract all the merchant names as well as money spent from the transaction data, converted this a CSV and used frequency analysis to search for common merchants in the transactions, which will be sent to the Google Cloud API's (NLP) to generate the custom sentences. The suggested saving strategy is calculated using a linear regression model - (lasso regression) favoring categories that are suggested based on the users spending.

<img src="https://user-images.githubusercontent.com/22798773/202869772-8c7ee845-e2dc-44d8-baee-de2b6293aefd.png" width="230" height="500"> | <img src="https://user-images.githubusercontent.com/22798773/202869769-9db0f795-2f3e-408c-8d4a-b140728ae036.png" width="230" height="500"> | <img src="https://user-images.githubusercontent.com/22798773/202869773-123ad0c7-3b61-4057-bade-8ee43d92a658.png" width="230" height="500"> | <img src="https://user-images.githubusercontent.com/22798773/202869766-9e32c9a9-a7ac-4e75-8006-8ff166a6a5c3.png" width="230" height="500"> | <img src="https://user-images.githubusercontent.com/22798773/202869776-824c2c6c-8e4d-4fff-b53a-e27dfdaeab85.png" width="230" height="500">  | <img src="https://user-images.githubusercontent.com/22798773/202869778-d5694098-bcee-460b-b8a1-de40d477ede3.png" width="230" height="500">  | <img src="https://user-images.githubusercontent.com/22798773/202869777-8d3a1dd4-4c49-40f4-bc9f-e6c2a92cd365.png" width="230" height="500"> 

References: 
https://cloud.google.com/natural-language
https://medium.com/analytics-vidhya/introduction-to-natural-language-processing-nlp-with-the-google-nlp-api-bddb2f2826b4
https://github.com/dsbuddy/SimpliFi
