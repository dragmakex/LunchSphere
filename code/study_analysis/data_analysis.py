import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

from scipy.stats import shapiro
from scipy.stats import levene
from scipy.stats import wilcoxon
from scipy.stats import ttest_rel
from scipy.stats import pearsonr

path_to_analysis = 'C:/Users/nisha/OneDrive/Desktop/ETH/human_computer_interaction/hci-project-hci2023-group-16/code/study_analysis'

# make dataframe from csv file containing all study results 
file_path = path_to_analysis + '/user_study_2_data.csv'
df = pd.read_csv(file_path)



# Set global font size
plt.rcParams['font.size'] = 16

##### Demographics

# Set up subplots
fig, axs = plt.subplots(1, 3, figsize=(12, 10))
plt.subplots_adjust(wspace=0.6, hspace=0.4)



avg_age = df['age'].mean()
med_age = df['age'].median()


# Plot 1: Tinder Familiarity
familiarity_counts = df['tinder_frequency'].value_counts().sort_index()
axs[0].bar(familiarity_counts.index, familiarity_counts, color='grey')
axs[0].set_xticks(np.arange(1, 6, 1))
axs[0].set_xlabel('Familiarity with Swiping \nApps like Tinder \n(1: low, 5: high)', fontsize=16)
axs[0].set_ylabel('Count', fontsize=16)

avg_tinder_familiarity = df['tinder_frequency'].mean()


# Plot 2: Frequency of Planning Lunches
frequency_counts = df['group_chat_frequency'].value_counts().sort_index()
axs[1].bar(frequency_counts.index, frequency_counts, color='grey')
axs[1].set_xticks(np.arange(1, 6, 1))
axs[1].set_yticks(np.arange(0, 8, 1))
axs[1].set_xlabel('Frequency of Planning Lunches \nvia Group Chats and in Person \n(1: low, 5: high)', fontsize=16)
axs[1].set_ylabel('Count', fontsize=16)

avg_planning_frequency = df['group_chat_frequency'].mean()


# Plot 3: Frequency of Self-Initiated Lunch
si_frequency_counts = df['self_initiated_lunch'].value_counts().sort_index()
axs[2].bar(si_frequency_counts.index, si_frequency_counts, color='grey')
axs[2].set_xticks(np.arange(1,6,1))
axs[2].set_xlabel('Frequency of Self-Initiated \nLunches (1: low, 5: high)', fontsize=16)
axs[2].set_ylabel('Count', fontsize=16)

avg_self_init_frequency = df['self_initiated_lunch'].mean()

plt.savefig(path_to_analysis + '/demographics_plots.png')
plt.close()



##### 1. Dependent variable: SUS values #####

number_of_bins = 20

# A
plt.hist(df['sus_a'], range=(40,100), bins=number_of_bins, color='blue', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(40,101,5))
plt.yticks(np.arange(0, 6, 1)) 
plt.xlabel('SUS Value')
plt.ylabel('Frequency')
plt.title(f'Histogram of SUS Values of A')

plt.savefig(path_to_analysis + '/histogram_sus_values_A')
plt.close()

# B
plt.hist(df['sus_b'], range=(40,100), bins=number_of_bins, color='red', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(40,101,5))
plt.yticks(np.arange(0, 6, 1)) 
plt.xlabel('SUS Value')
plt.ylabel('Frequency')
plt.title(f'Histogram of SUS Values of B')

plt.savefig(path_to_analysis + '/histogram_sus_values_B')
plt.close()


# Do Shapiro-Wilke Test
shapiro_res_sus_a = shapiro(df['sus_a'])
shapiro_res_sus_b = shapiro(df['sus_b'])


# Do Levene Test
# Separate the data into the groups
group_a = df[df['a_or_b'] == 'a']
group_b = df[df['a_or_b'] == 'b']

# Perform Levene's test for 'sus_a'
levene_test_sus_a = levene(group_a['sus_a'], group_b['sus_a'])

# Perform Levene's test for 'sus_b'
levene_test_sus_b = levene(group_a['sus_b'], group_b['sus_b'])

# Perform levene test differently:
levene_test_sus_both = levene(df['sus_a'],df['sus_b'])


# Do Wilcoxon Signed Rank Test
wilcoxon_res_sus = wilcoxon(df['sus_a'], df['sus_b'])


# Calculate useful metrics
avg_sus_value_a = df['sus_a'].mean()
avg_sus_value_b = df['sus_b'].mean()
std_sus_value_a = df['sus_a'].std()
std_sus_value_b = df['sus_b'].std()

mean_sus = [avg_sus_value_a, avg_sus_value_b]
stddev_sus = [std_sus_value_a, std_sus_value_b]



##### 2. Dependent variable: Time needed to select a group

number_of_bins = 12

# A
plt.hist(df['time_a'], range=(0,60), bins=number_of_bins, color='blue', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(0,61,5))
plt.yticks(np.arange(0, 5, 1)) 
plt.xlabel('Time Needed to Select a Group')
plt.ylabel('Frequency')
plt.title(f'Histogram of Time Needed to Select a Group in A Test')

plt.savefig(path_to_analysis + '/histogram_time_A')
plt.close()

# B
plt.hist(df['time_b'], range=(0,60), bins=number_of_bins, color='red', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(0,61,5))
plt.yticks(np.arange(0, 5, 1)) 
plt.xlabel('Time Needed to Select a Group')
plt.ylabel('Frequency')
plt.title(f'Histogram of Time Needed to Select a Group in B Test')

plt.savefig(path_to_analysis + '/histogram_time_B')
plt.close()


# Do Shapiro-Wilke Test
shapiro_res_time_a = shapiro(df['time_a'])
shapiro_res_time_b = shapiro(df['time_b'])


# Do Levene Test
# Separate the data into the groups
group_a = df[df['a_or_b'] == 'a']
group_b = df[df['a_or_b'] == 'b']

# Perform Levene's test for 'sus_a'
levene_test_time_a = levene(group_a['time_a'], group_b['time_a'])

# Perform Levene's test for 'sus_b'
levene_test_time_b = levene(group_a['time_b'], group_b['time_b'])

#perform levene test differently:
levene_test_time_both = levene(df['time_a'],df['time_b'])


# Do paired t-test
paired_ttest_time = ttest_rel(df['time_a'], df['time_b'])


# Calculate useful metrics
avg_time_value_a = df['time_a'].mean()
avg_time_value_b = df['time_b'].mean()
std_time_value_a = df['time_a'].std()
std_time_value_b = df['time_b'].std()

mean_times = [avg_time_value_a, avg_time_value_b]
stddev_time = [std_time_value_a, std_time_value_b]



##### 3. Dependent variable: Amount of interactions the user has to do ()

number_of_bins = 7

# A
plt.hist(df['gesture_count_a'], range=(0,35), bins=number_of_bins, color='blue', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(0,35,5))
plt.yticks(np.arange(0, 10, 1)) 
plt.xlabel('Gesture Count')
plt.ylabel('Frequency')
plt.title(f'Histogram of Gesture Count in A Test')

plt.savefig(path_to_analysis + '/histogram_gesture_count_A')
plt.close()

# B
plt.hist(df['gesture_count_b'], range=(0,35), bins=number_of_bins, color='red', edgecolor='black', alpha=0.7)
plt.xticks(np.arange(0,35,5))
plt.yticks(np.arange(0, 10, 1)) 
plt.xlabel('Gesture Count')
plt.ylabel('Frequency')
plt.title(f'Histogram of Gesture Count in B Test')

plt.savefig(path_to_analysis + '/histogram_gesture_count_B')
plt.close()


# Do Shapiro-Wilke Test
shapiro_res_gesture_count_a = shapiro(df['gesture_count_a'])
shapiro_res_gesture_count_b = shapiro(df['gesture_count_b'])


# Do Levene Test
# Separate the data into the groups
group_a = df[df['a_or_b'] == 'a']
group_b = df[df['a_or_b'] == 'b']

# Perform Levene's test for 'sus_a'
levene_test_gesture_count_a = levene(group_a['gesture_count_a'], group_b['gesture_count_a'])

# Perform Levene's test for 'sus_b'
levene_test_gesture_count_b = levene(group_a['gesture_count_b'], group_b['gesture_count_b'])

# Perform levene test differently:
levene_test_gesture_count_both = levene(df['gesture_count_a'],df['gesture_count_b'])


# Do paired t-test
ttest_res_gesture_count = ttest_rel(df['gesture_count_a'], df['gesture_count_b'])


# Calculate useful metrics
avg_gesture_count_value_a = df['gesture_count_a'].mean()
avg_gesture_count_value_b = df['gesture_count_b'].mean()
std_gesture_count_value_a = df['gesture_count_a'].std()
std_gesture_count_value_b = df['gesture_count_b'].std()

mean_gesture_counts = [avg_gesture_count_value_a, avg_gesture_count_value_b]
stddev_gesture_counts = [std_gesture_count_value_a, std_gesture_count_value_b]





fig2, ax2 = plt.subplots(1, 3, figsize=(12, 10))

plt.subplots_adjust(wspace=0.6, hspace=0.4)
ax2[0].bar(['A', 'B'], mean_sus, yerr=stddev_sus, color=['blue', 'red'], width=0.4)
ax2[0].set_ylabel('SUS value',fontsize=18)

ax2[1].bar(['A', 'B'], mean_times, yerr=stddev_time, color=['blue', 'red'], width=0.4)
ax2[1].set_ylabel('Time in seconds',fontsize=18)

ax2[2].bar(['A', 'B'], mean_gesture_counts, yerr=stddev_gesture_counts, color=['blue', 'red'], width=0.4)
ax2[2].set_ylabel('Gesture Count',fontsize=18)

plt.savefig(path_to_analysis + '/all_means_plots.png')
plt.close()




### Calculate corrleation between tinder familiarity and sus_b

correlation_coefficient, p_value = pearsonr(df['tinder_frequency'], df['sus_b'])
print(correlation_coefficient)
print(p_value)



# Write Results to Markdown File
with open(path_to_analysis + '/results.md', 'w') as file:
    file.write('# Data Analysis Results\n')
    file.write('## Properties of Data\n')


    file.write('### Demographics\n')
    html_img_txt = '<img src="demographics_plots.png" alt="Distribution of SUS Values in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')
    file.write('Average Age: ' + str(np.round(avg_age,1)) + '\n\n')
    file.write('Median Age: ' + str(med_age) + '\n\n')
    file.write('Average Tinder Familiarity: ' + str(np.round(avg_tinder_familiarity,1)) + '\n\n')
    file.write('Average Planning Frequency: ' + str(np.round(avg_planning_frequency,1)) + '\n\n')
    file.write('Average self-initiated lunch frequency: ' + str(np.round(avg_self_init_frequency,1)) + '\n\n') 



    file.write('### First Dependent Variable: SUS Values\n')
    file.write('NH1: The swiping feature instead of the button accept feature has no impact on the SUS value of the user.\n\n')

    file.write('#### Distribution of SUS Values in A Test\n')
    file.write('Result of Shapiro-Wilke Test A: ')
    file.write('p-value: ' + str(round(shapiro_res_sus_a[1],3)) + '\n')
    html_img_txt = '<img src="histogram_sus_values_A.png" alt="Distribution of SUS Values in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('#### Distribution of SUS Values in B Test\n')
    file.write('Result of Shapiro-Wilke Test B: ')
    file.write('p-value: ' + str(round(shapiro_res_sus_b[1],3)) + '\n')
    html_img_txt = '<img src="histogram_sus_values_B.png" alt="Distribution of SUS Values in B Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('#### Results of Levene Tests:\n\n')
    file.write('p val of Levene test for sus_a (started with A vs started with B): ' + str(np.round(levene_test_sus_a[1],3)) + '\n\n')
    file.write('p val of Levene test for sus_b (started with A vs started with B): ' + str(np.round(levene_test_sus_b[1],3)) + '\n\n')
    file.write('p val of Levene test for sus_a vs sus_b: ' + str(np.round(levene_test_sus_both[1],3)) + '\n\n')

    file.write('#### Result of Wilcoxon Signed Rank Test:\n\n')
    file.write('Z val of Wilcoxon Signed Rank Test on sus_a vs sus_b: ' + str(np.round(wilcoxon_res_sus[0],3)) + '\n\n')
    file.write('p val of Wilcoxon Test on sus_a vs sus_b: ' + str(np.round(wilcoxon_res_sus[1],3)) + '\n\n')
    
    file.write('#### Other Useful Metrics:\n\n')
    file.write('Average sus_a: ' + str(np.round(avg_sus_value_a,3)) + ' and standard deviation: ' + str(np.round(std_sus_value_a,3)) + '\n\n')
    file.write('Average sus_b: ' + str(np.round(avg_sus_value_b,3)) + ' and standard deviation: ' + str(np.round(std_sus_value_b,3)) + '\n\n')
    



    file.write('### Second Dependent Variable: Time Needed to Select a Group\n')
    file.write('NH2: The swiping feature instead of the button accept feature has no impact on the time needed to select a group.\n\n')

    file.write('#### Distribution of Time Needed to Select a Group in A Test\n')
    html_img_txt = '<img src="histogram_time_A.png" alt="Distribution of Time Needed to Select a Group in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('Result of Shapiro-Wilke Test A\n')
    file.write('p-value: ' + str(round(shapiro_res_time_a[1],3)) + '\n')

    file.write('#### Distribution of Time Needed to Select a Group in B Test\n')
    html_img_txt = '<img src="histogram_time_B.png" alt="Distribution of Time Needed to Select a Group in B Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('Result of Shapiro-Wilke Test B\n')
    file.write('p-value: ' + str(round(shapiro_res_time_b[1],3)) + '\n')
    
    file.write('#### Results of Levene Tests:\n\n')
    file.write('p val of Levene test for sus_a (started with A vs started with B): ' + str(np.round(levene_test_time_a[1],3)) + '\n\n')
    file.write('p val of Levene test for sus_b (started with A vs started with B): ' + str(np.round(levene_test_time_b[1],3)) + '\n\n')
    file.write('p val of Levene test for sus_a vs sus_b: ' + str(np.round(levene_test_time_both[1],3)) + '\n\n')

    file.write('#### Result of Paired Students t-test:\n\n')
    file.write('DOF val of Paired Students t-test on time_a vs time_b: ' + str(np.round(paired_ttest_time[0],3)) + '\n\n')
    file.write('p val of Paired Students t-test on time_a vs time_b: ' + str(np.round(paired_ttest_time[1],3)) + '\n\n')
    
    file.write('#### Other Useful Metrics:\n\n')
    file.write('Average time_a: ' + str(np.round(avg_time_value_a,3)) + ' and standard deviation: ' + str(np.round(std_time_value_a,3)) + '\n\n')
    file.write('Average time_b: ' + str(np.round(avg_time_value_b,3)) + ' and standard deviation: ' + str(np.round(std_time_value_b,3)) + '\n\n')
    



    file.write('### Third Dependent Variable: Gesture Count\n')
    file.write('NH3: The swiping feature instead of the button accept feature has no impact on the amount of interactions (i.e., taps/swipes) the user has to do.\n\n')

    file.write('#### Distribution of Gesture Counts in A Test\n')
    html_img_txt = '<img src="histogram_gesture_count_A.png" alt="Distribution of Gesute Counts in A Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('Result of Shapiro-Wilke Test A\n')
    file.write('p-value: ' + str(round(shapiro_res_gesture_count_a[1],3)) + '\n')

    file.write('#### Distribution of Gesture Counts in B Test\n')
    html_img_txt = '<img src="histogram_gesture_count_B.png" alt="Distribution of Gesture Counts in B Test" width="400"/>'
    file.write(html_img_txt + '\n\n')

    file.write('Result of Shapiro-Wilke Test B\n')
    file.write('p-value: ' + str(round(shapiro_res_time_b[1],3)) + '\n')
    
    file.write('#### Results of Levene Tests:\n\n')
    file.write('p val of Levene test for gesture_count_a (started with A vs started with B): ' + str(np.round(levene_test_gesture_count_a[1],3)) + '\n\n')
    file.write('p val of Levene test for gesture_count_b (started with A vs started with B): ' + str(np.round(levene_test_gesture_count_b[1],3)) + '\n\n')
    file.write('p val of Levene test for gesture_count_a vs gesture_count_b: ' + str(np.round(levene_test_gesture_count_both[1],3)) + '\n\n')

    file.write('#### Result of Paired Students t-test:\n\n')
    file.write('DOF val of paired t-test on gesutre_count_a vs gesture_count_b: ' + str(np.round(ttest_res_gesture_count[0],3)) + '\n\n')
    file.write('p val of paired t-test on gesture_count_a vs gesture_count_b: ' + str(np.round(ttest_res_gesture_count[1],3)) + '\n\n')
    
    file.write('#### Other Useful Metrics:\n\n')
    file.write('Average gesture_count_a: ' + str(np.round(avg_gesture_count_value_a,3)) + ' and standard deviation: ' + str(np.round(std_gesture_count_value_a,3)) + '\n\n')
    file.write('Average gesture_count_b: ' + str(np.round(avg_gesture_count_value_b,3)) + ' and standard deviation: ' + str(np.round(std_gesture_count_value_b,3)) + '\n\n')
    
    
    file.write('#### Means and Standard Deviations of the 3 Variables\n')
    html_img_txt = '<img src="all_means_plots.png" alt="All Means" width="400"/>'
    file.write(html_img_txt + '\n\n')