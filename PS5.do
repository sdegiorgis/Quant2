pwd //to see where we are
cd "home/ru/svd30/downloads" //I'm using the Rutgers apps server so just changing the working directory to my downloads folder where the data is
use gpa.dta
gen semale = male * se //creating the interaction variable for gender and field of study
regress gpa male se semale //model 1
estimates store model1
regress gpa male se semale work study //model 2
estimates store model2
gen sework = work * se //creating the interaction variable for hours of work per week and field of study
gen sestudy = study * se //creating the interaction variable for hours of study per week and field of study
reg gpa male se semale work study sework sestudy //model 3
estimates store model3
esttab * //to make a pretty table
estimates restore model2 //model 2 active
regress, coeflegend //to see the variable names
dis _b[_cons]+_b[male]+_b[se]+_b[semale]+_b[work]*10+_b[study]*10 //plugging in 10 hours work and 10 hours study
summarize gpa //1.7 seemed low for a gpa so I looked at the mean and it's only ~2 so 1.7 seems reasonable
