################################################################

## LAB 2 NOTES
## EXPLORING CATEGORICAL DATA

################################################################


# We will use the orange.txt data set. Import that data set at this time.

################################################################

##### PART I: SINGLE CATEGORICAL VARIABLE

## Let's investigate the distribution of the variable color.

#------------------------------------------------------------
# Frequency table

    # General code:

table(zzz$xxx)
    # Replace zzz with the name of the data set
    # Replace xxx with the name of the variable

    # Example:

table(orange$color)


    # If desired, you can save the table of counts to a variable

tbl <- table(orange$color)

    # Display the variable tbl
tbl

#---------------------------------------------------------------
# Proportions table

    # General code:

prop.table(table(zzz$xxx))
    # Replace zzz with the name of the data set
    # Replace xxx with the name of the variable

    # Example:

prop.table(table(orange$color))

    # Option 2: since the table of counts was saved as tbl, use tbl in 
    #           the parentheses

prop.table(tbl)



#------------------------------------------------------------
# Convert the proportions to a table of percentages

100 * prop.table(table(orange$color))

    # or

100*prop.table(tbl)


#------------------------------------------------------------
# Graphical display: bar chart

    # General code

barplot(table(zzz$xxx),
        col = " ",
        main = " ",
        xlab = " ",
        ylab = " ")

    # Replace zzz with the name of the data set
    # Replace xxx with the name of the variable
    # Type the name of the desired color of the bars between the quotes in 
    #       in the col = " " argument
    # Type a title between the quotes in the main = " " argument
    # Type a label for the x-axis between the quotes in the 
    #       xlab = " " argument
    # Type a label for the y-axis between the quotes in the 
    #       ylab = " " argument

# Example:

barplot(table(orange$color), 
        col = "grey",
        main = "Wearing Orange on Fridays",
        xlab = "wear orange on Friday?", 
        ylab = "frequency")

    # suggestion: put each argument on a separate line. 
    # Separate each argument with a comma.

    # to add a subtitle, use the mtext(" ") command.

mtext("OSU students, staff, and faculty")



    # bar chart with proportions

barplot(prop.table(table(orange$color)), 
        col = "grey",
        main = "Wearing Orange on Fridays",
        xlab = "wear orange on Friday?", 
        ylab = "proportion")
mtext("OSU students, staff, and faculty")


    # bar chart with percentages

barplot(100*prop.table(table(orange$color)), 
        col = "grey",
        main = "Wearing Orange on Fridays",
        xlab = "wear orange on Friday?",
        ylab = "percentages")
mtext("OSU students, staff, and faculty")


#--------------------------------------------------------
# Graphical display: pie chart

pie(table(orange$color), 
    main = "Wearing Orange on Fridays")
mtext("OSU students, staff, and faculty")


    # change colors of slices of pie

pie(table(orange$color), 
    main = "Wearing Orange on Fridays",
    col = c("blue","red"))
mtext("OSU students, staff, and faculty")

    # Note: the first color listed corresponds to the category that comes
    #   first alphabetically.



#########################################################################

### PART II: Relationship between two categorical variables


    # Table of Counts

    # General code

table(zzz$yyy, zzz$xxx)

    # Replace zzz with the name of the data set
    # Replace yyy with the name of the response variable
    # Replace xxx with the name of the explanatory variable

    # Note that we will always put the response variable first

# Example:

table(orange$color, orange$lecture)


    # We could save the table of counts to a variable name:

table.counts <- table(orange$color, orange$lecture)



#----------------------------------------------------------------------
    # Proportions table

    # The last argument tells which total to use in the denominator
    # in the calculation of proportions. 
        ## "margin = 2" uses column totals. 
        ## margin = 1 uses the row totals as the denominator.

    #   If we set up the table of counts with the rows as the 
    #   categories of the response variable and columns as the 
    #   categories of the explanatory variable, we'll always use 
    #   margin = 2 to obtain the appropriate comparison proportions.


prop_tbl <- prop.table(table(orange$color, orange$lecture), margin = 2)
prop_tbl


    #   Note: since we stored our table of counts in a variable called table.counts, 
    #   we can simplify the command for the proportions table by using this variable
    #   name:
    
prop_tbl <- prop.table(table.counts, margin = 2)


#-------------------------------------------------------------------------
# side-by-side bar chart

    # General code

barplot(ppp, beside = TRUE,
        col = c("","",etc),
        main = " ",
        xlab = " ",
        ylab = " ")

    # Replace ppp with the commands for either the proportions table or
    #   percentages table (or the name given to either of these two)
    # Use the col = c() argument to assign different colors for each of 
    # the connected bars.
        ##  Create a vector of colors with as many colors as categories 
        ##  of the response variable.
            ### The name of the color is typed between double quotes.
            ### Separate each color with a comma.
            ### The assignment of the colors to the categories is 
            ###  alphabetical by category name: the first color in  
            ###  the vector of colors in the col = argument is assigned 
            ###  to the category of the response variable that
            ###  comes first alphabetically, and so on.
    # Type a title between the quotes in the main = " " argument
    # Type a label for the x-axis between the quotes in the 
    #   xlab = " " argument
    # Type a label for the y-axis between the quotes in the 
    #   ylab = " " argument


    # In this example, we'll use the appropriate proportions, which 
    # were stored in the 'prop_tbl' variable above.
    
# Example:

barplot(prop_tbl, beside = TRUE,
        col = c("red","blue"),
        main = "Wearing Orange on Fridays",
        xlab = "wear orange on Friday?", 
        ylab = "proportions")


    # Add a legend to the graph to identify which bar goes with which 
    # category. This is done by adding a legend() argument.

legend("topright", c("no","yes"), 
       fill=c("red","blue"))

    # The first argument is the location in the graph to put the legend. 
        ## When using text, put the text in double quotes
    # The second argument is a vector of names of the categories in 
    #   alphabetical order
    # The third argument is a vector of the colors (same order as in the
    #   col = argument in the barplot command)


    # We sometimes may run into a problem: the legend overlaps some of 
    # the bars. We can eliminate this problem using a combination of two 
    # things:
        # 1) Change the scale on the y-axis using the ylim = c(min,max) 
        #    argument
             ## Replace 'min' with the minimum value on the y-axis. 
                ### ALWAYS USE 0 FOR THE MINIMUM!!
             ## Replace 'max' with the maximum value on the y-axis. 
        # 2) Add cex =  argument to the legend() command
             ## cex changes the font size.
                ### A value < 1 shrinks the font size
                ### A value > 1 increases the font size
                ### We will want to shrink the font size
        # You may have to try different combination of values so that 
        # the legend does not overlap any of the bars.

# Here is code for a starting point.

barplot(prop_tbl, beside = TRUE,
        ylim = c(0,1),
        col = c("red","blue"),
        main = "Wearing Orange on Fridays",
        xlab = "wear orange on Friday?", 
        ylab = "proportions")
legend("topright", c("no","yes"), 
       fill=c("red","blue"), cex = 0.7)

