import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

from scipy.stats import shapiro
from scipy.stats import levene

path_to_analysis = 'C:/Users/nisha/OneDrive/Desktop/ETH/human_computer_interaction/hci-project-hci2023-group-16/code/study_analysis'

# make dataframe from csv file containing all study results 
file_path = path_to_analysis + '/user_study_data.csv'
df = pd.read_csv(file_path)



##### 1. Dependent variable: SUS values #####

number_of_bins = 20

# A
plt.hist(df['sus_a'], range=(40,100), bins=number_of_bins, color='blue', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(40,101,5))
plt.yticks(np.arange(0, 5, 1)) 
plt.xlabel('SUS Value')
plt.ylabel('Frequency')
plt.title(f'Histogram of SUS Values of A (Bin Size: {number_of_bins})')

plt.savefig(path_to_analysis + '/histogram_sus_values_A')
plt.close()

# B
plt.hist(df['sus_b'], range=(40,100), bins=number_of_bins, color='red', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(40,101,5))
plt.yticks(np.arange(0, 5, 1)) 
plt.xlabel('SUS Value')
plt.ylabel('Frequency')
plt.title(f'Histogram of SUS Values of B (Bin Size: {number_of_bins})')

plt.savefig(path_to_analysis + '/histogram_sus_values_B')
plt.close()


# Do Shapiro-Wilke Test
shapiro_res_a = shapiro(df['sus_a'])
shapiro_res_b = shapiro(df['sus_b'])


# Do Levene Test
# ...



##### 2. Dependent variable: Time needed to select a group

number_of_bins = 24

# A
plt.hist(df['time_a'], range=(0,120), bins=number_of_bins, color='blue', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(0,121,5))
plt.yticks(np.arange(0, 5, 1)) 
plt.xlabel('Time Needed to Select a Group')
plt.ylabel('Frequency')
plt.title(f'Histogram of Time Needed to Select a Group in A Test (Bin Size: {number_of_bins})')

plt.savefig(path_to_analysis + '/histogram_time_A')
plt.close()

# B
plt.hist(df['time_b'], range=(0,120), bins=number_of_bins, color='blue', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(0,121,5))
plt.yticks(np.arange(0, 5, 1)) 
plt.xlabel('Time Needed to Select a Group')
plt.ylabel('Frequency')
plt.title(f'Histogram of Time Needed to Select a Group in B Test (Bin Size: {number_of_bins})')

plt.savefig(path_to_analysis + '/histogram_time_B')
plt.close()


# Do Shapiro-Wilke Test
shapiro_res_a = shapiro(df['time_a'])
shapiro_res_b = shapiro(df['time_b'])


# Do Levene Test
# ...





# Write Results to Markdown File
with open(path_to_analysis + '/results.md', 'w') as file:
    file.write('# Data Analysis Results\n')
    file.write('## Properties of Data\n')


    file.write('### Distribution of SUS Values in A Test\n')
    html_img_txt = '<img src="histogram_sus_values_A.png" alt="Distribution of SUS Values in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('### Result of Shapiro-Wilke Test A\n')
    file.write('p-value: ' + str(round(shapiro_res_a[1],3)) + '\n')
    if (shapiro_res_a[1] > 0.05): file.write('-> We can assume a normal distribution.\n') 
    else: file.write('-> We cannot assume a normal distribution.')

    file.write('### Distribution of SUS Values in B Test\n')
    html_img_txt = '<img src="histogram_sus_values_B.png" alt="Distribution of SUS Values in B Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('### Result of Shapiro-Wilke Test B\n')
    file.write('p-value: ' + str(round(shapiro_res_b[1],3)) + '\n')
    if (shapiro_res_b[1] > 0.05): file.write('-> We can assume a normal distribution.\n') 
    else: file.write('-> We cannot assume a normal distribution.\n')


    file.write('### Distribution of Time Needed to Select a Group in A Test\n')
    html_img_txt = '<img src="histogram_time_A.png" alt="Distribution of Time Needed to Select a Group in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('### Result of Shapiro-Wilke Test A\n')
    file.write('p-value: ' + str(round(shapiro_res_a[1],3)) + '\n')
    if (shapiro_res_a[1] > 0.05): file.write('-> We can assume a normal distribution.\n') 
    else: file.write('-> We cannot assume a normal distribution.')

    file.write('### Distribution of Time Needed to Select a Group in B Test\n')
    html_img_txt = '<img src="histogram_time_B.png" alt="Distribution of Time Needed to Select a Group in B Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('### Result of Shapiro-Wilke Test B\n')
    file.write('p-value: ' + str(round(shapiro_res_b[1],3)) + '\n')
    if (shapiro_res_b[1] > 0.05): file.write('-> We can assume a normal distribution.\n') 
    else: file.write('-> We cannot assume a normal distribution.')
    

