import matplotlib.pyplot as plt
import pandas as pd

from scipy.stats import shapiro
from scipy.stats import levene

path_to_analysis = 'C:/Users/nisha/OneDrive/Desktop/ETH/human_computer_interaction/hci-project-hci2023-group-16/code/study_analysis'

# make dataframe from csv file containing all study results 
file_path = path_to_analysis + '/user_study_data.csv'
df = pd.read_csv(file_path)


# plotting SUS values of A and B as histogram
number_of_bins = 20

# A
plt.hist(df['sus_a'], bins=number_of_bins, color='blue', edgecolor='black', alpha=0.7)
plt.xlabel('SUS Value')
plt.ylabel('Frequency')
plt.title(f'Histogram of SUS Values of A (Bin Size: {number_of_bins})')

plt.savefig(path_to_analysis + '/histogram_sus_values_A')
plt.close()

# B
plt.hist(df['sus_b'], bins=number_of_bins, color='red', edgecolor='black', alpha=0.7)
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


# Write Results to Markdown File
with open(path_to_analysis + '/results.md', 'w') as file:
    file.write('# Data Analysis Results\n')
    file.write('## Properties of Data\n')

    file.write('### Distribution of SUS Values in A Test\n')
    img_url = f'{path_to_analysis}/histogram_sus_values_A'
    html_img_txt = f'<img src="{img_url}" alt="Distribution of SUS Values in A Test" width="500"'
    file.write(html_img_txt + '\n')
    