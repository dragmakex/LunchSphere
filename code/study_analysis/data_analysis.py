import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

from scipy.stats import shapiro
from scipy.stats import levene

path_to_analysis = 'C:/Users/nisha/OneDrive/Desktop/ETH/human_computer_interaction/hci-project-hci2023-group-16/code/study_analysis'

# make dataframe from csv file containing all study results 
file_path = path_to_analysis + '/user_study_data.csv'
df = pd.read_csv(file_path)



##### Demographics

# Set up subplots
fig, axs = plt.subplots(2, 3, figsize=(12, 10))
plt.subplots_adjust(wspace=0.6, hspace=0.4)

# Plot 1: Age Distribution
age_counts = df['age'].value_counts()
axs[0, 0].bar(age_counts.index, age_counts, color='grey')
axs[0, 0].set_xticks(np.arange(21,27,1))
axs[0, 0].set_yticks(np.arange(0,5,1))
axs[0, 0].set_xlabel('Age')
axs[0, 0].set_ylabel('Count')

avg_age = df['age'].mean()
med_age = df['age'].median()


# Plot 2: Gender Distribution
gender_counts = df['gender'].value_counts()
axs[1, 0].pie(gender_counts.values, labels=gender_counts.index, autopct='%1.1f%%', startangle=90, colors=['skyblue', 'lightcoral'])
axs[1, 0].set_title('Gender Distribution')


# Plot 3: Tinder Familiarity
familiarity_counts = df['tinder_frequency'].value_counts().sort_index()
axs[0, 1].bar(familiarity_counts.index, familiarity_counts, color='grey')
axs[0, 1].set_xticks(np.arange(1, 6, 1))
axs[0, 1].set_xlabel('Familiarity with Swiping Apps like Tinder \n(1: low, 5: high)')
axs[0, 1].set_ylabel('Count')

avg_tinder_familiarity = df['tinder_frequency'].mean()


# Plot 4: Frequency of Planning Lunches
frequency_counts = df['group_chat_frequency'].value_counts().sort_index()
axs[1, 1].bar(frequency_counts.index, frequency_counts, color='grey')
axs[1, 1].set_xticks(np.arange(1, 6, 1))
axs[1, 1].set_yticks(np.arange(0, 5, 1))
axs[1, 1].set_xlabel('Frequency of Planning Lunches via Group Chats\n and in Person (1: low, 5: high)')
axs[1, 1].set_ylabel('Count')

avg_planning_frequency = df['group_chat_frequency'].mean()


# Plot 5: Frequency of Self-Initiated Lunch
si_frequency_counts = df['self_initiated_lunch'].value_counts().sort_index()
axs[0, 2].bar(si_frequency_counts.index, si_frequency_counts, color='grey')
axs[0, 2].set_xticks(np.arange(1,6,1))
axs[0, 2].set_xlabel('Frequency of Self-Initiated Lunches \n(1: low, 5: high)')
axs[0, 2].set_ylabel('Count')

avg_self_init_frequency = df['self_initiated_lunch'].mean()

fig.delaxes(axs[1, 2])
plt.savefig(path_to_analysis + '/demographics_plots.png')
plt.show()


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
levene_res_a = levene(df['sus_a'], df['sus_b'])



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



##### 3. Dependent variable: Amount of interactions the user has to do ()

# to do




# Write Results to Markdown File
with open(path_to_analysis + '/results.md', 'w') as file:
    file.write('# Data Analysis Results\n')
    file.write('## Properties of Data\n')

    file.write('### First dependent variable: SUS Values\n')
    file.write('NH1: The swiping feature instead of the button accept feature has no impact on the SUS value of the user.\n\n')

    file.write('#### Distribution of SUS Values in A Test\n')
    file.write('Result of Shapiro-Wilke Test A: ')
    file.write('p-value: ' + str(round(shapiro_res_a[1],3)) + '\n')
    if (shapiro_res_a[1] > 0.05): file.write('-> We can assume a normal distribution.\n\n') 
    else: file.write('-> We cannot assume a normal distribution.\n\n')
    html_img_txt = '<img src="histogram_sus_values_A.png" alt="Distribution of SUS Values in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('#### Distribution of SUS Values in B Test\n')
    file.write('Result of Shapiro-Wilke Test B: ')
    file.write('p-value: ' + str(round(shapiro_res_b[1],3)) + '\n')
    if (shapiro_res_b[1] > 0.05): file.write('-> We can assume a normal distribution.\n\n') 
    else: file.write('-> We cannot assume a normal distribution.\n\n')
    html_img_txt = '<img src="histogram_sus_values_B.png" alt="Distribution of SUS Values in B Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    

    file.write('### Result of Levene Test on Distribution of SUS Values\n')
    file.write('p-value: ' + str(round(levene_res_a[1],3)) + '\n')
    if (levene_res_a[1] > 0.05): file.write('-> We can assume the variances of the SUS values are equal for the groups A and B\n')
    else: file.write('-> We can assume the variances of the SUS values are not equal for the groups A and B\n')


    file.write('### Distribution of Time Needed to Select a Group in A Test\n')
    html_img_txt = '<img src="histogram_time_A.png" alt="Distribution of Time Needed to Select a Group in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('#### Result of Shapiro-Wilke Test A\n')
    file.write('p-value: ' + str(round(shapiro_res_a[1],3)) + '\n')
    if (shapiro_res_a[1] > 0.05): file.write('-> We can assume a normal distribution.\n') 
    else: file.write('-> We cannot assume a normal distribution.')

    file.write('### Distribution of Time Needed to Select a Group in B Test\n')
    html_img_txt = '<img src="histogram_time_B.png" alt="Distribution of Time Needed to Select a Group in B Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('#### Result of Shapiro-Wilke Test B\n')
    file.write('p-value: ' + str(round(shapiro_res_b[1],3)) + '\n')
    if (shapiro_res_b[1] > 0.05): file.write('-> We can assume a normal distribution.\n') 
    else: file.write('-> We cannot assume a normal distribution.')
    

