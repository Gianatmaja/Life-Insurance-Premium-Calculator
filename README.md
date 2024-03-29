# Life Insurance Premium Calculator

### Quick Links:  
- [View web application](https://gian-atmaja.shinyapps.io/LI_Premium/)
- [View slide deck](https://rpubs.com/Ga25/620229)

### Description:  
This web application, deployed using R's shiny, estimates the cost of coverage for a life insurance policy in Indonesia.
The calculations used are based on the life table from the [Global Health Observatory Data Repository](https://apps.who.int/gho/data/view.main.60750?lang=en).

The inputs taken by the web application includes:
- Type of policy (Whole-life, Endowment, and Term Insurance)
- Term of protection (For endowment and term policies)
- Age, gender, and smoking status
- Sum assured

The web application then outputs an amount, representing the annual cost of coverage required under the inputs and set assumptions.

### Methodology
We take the following assumptions to calculate the premium:
- Risk free rate of 4% per annum.
- Smoking increases mortality rate by 30%.
- Life table taken from the [Global Health Organization](link:%20https://apps.who.int/gho/data/view.main.60750?lang=en)

The method used to calculate the premium is the equivalence principle. This method mathces the benefits paid to the premium received, with regards to the death risk at each age and the risk-free rate.

### Web App in Action
Some screenshots of the web app in action can be viewed below.

![Image1](https://github.com/Gianatmaja/Life-Insurance-Premium-Calculator/blob/master/Images/WebApp1.png)

![Image2](https://github.com/Gianatmaja/Life-Insurance-Premium-Calculator/blob/master/Images/WebApp2.png)

