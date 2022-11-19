#create a lasso regression model to find the most useful variables
from sklearn.model_selection import GridSearchCV
from sklearn.linear_model import Lasso

def grid_search_lasso_regression(data, y, X):

    #creating an estimator model
    lasso_model = Lasso(fit_intercept=True)

    #list of alphas to be used in search
    alphas = np.logspace(-12, np.log(1), base=np.exp(1), num=100)
    #parameter grid will take alphas and put them in a dictonary
    param_grid = [{'alpha':alphas}]

    #creating the model
    clf = GridSearchCV(lasso_model, param_grid=param_grid,cv = 5, refit=True)
    #set to our data
    clf.fir(data[x], data[y])

    #find estimator
    lasso_best = clf.best_estimator_
    alpha_best = clf.best_params_

    return lasso_best

    #set x
