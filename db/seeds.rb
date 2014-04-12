# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group_headers = GroupHeader.create(name: 'Events')
demographics = GroupHeader.create(name: 'Demographics')
housing = GroupHeader.create(name: 'Housing')
schooling = GroupHeader.create(name: 'Schooling')
occupation = GroupHeader.create(name: 'Occupation')

# Population total
berkeley_pop = Group.create(name: 'Berkeley Population', group_header: demographics)

# Race
race_white = Group.create(name: 'White', group_header: demographics)
race_african_american = Group.create(name: 'African American', group_header: demographics)
race_indian = Group.create(name: 'Indian', group_header: demographics)
race_japanese = Group.create(name: 'Japanese', group_header: demographics)
race_chinese = Group.create(name: 'Chinese', group_header: demographics)

# White person with Spanish surname
white_spanish_surname = Group.create(name: 'White, Spanish Surname', group_header: demographics)

# Sex
male = Group.create(name: 'Male', group_header: demographics)
female = Group.create(name: 'Female', group_header: demographics)

# Age
age_under_5 = Group.create(name: 'Under 5 years', group_header: demographics)
age_5_to_17 = Group.create(name: '5 to 17 years', group_header: demographics)
age_18_to_64 = Group.create(name: '18 to 64 years', group_header: demographics)
age_65_over = Group.create(name: '65 years and over', group_header: demographics)
age_median = Group.create(name: 'Median age', group_header: demographics)

# Household
household = Group.create(name: 'Persons per Household', group_header: housing)

# Housing occupancy
housing_total = Group.create(name: 'All housing units', group_header: housing)
occupied_housing = Group.create(name: 'Occupied housing units', group_header: housing)
owner_occupied = Group.create(name: 'Owner occupied housing units', group_header: housing)
renter_occupied = Group.create(name: 'Renter occupied housing units', group_header: housing)
vacant = Group.create(name: 'Vacant housing units', group_header: housing)

# Income
income = Group.create(name: 'Families median income (in dollars)', group_header: demographics)

# Schooling
pop_over_25 = Group.create(name: 'Population 25 years and over', group_header: schooling)
high_school = Group.create(name: 'Highest schooling: completed high school (4 years)', group_header: schooling)
college = Group.create(name: 'Highest schooling: completed college (4+ years)', group_header: schooling)

# Occupation
employed = Group.create(name: 'Employed', group_header: occupation)
professional = Group.create(name: 'Professional and technical', group_header: occupation)
farmers = Group.create(name: 'Farmers and farm managers', group_header: occupation)
managers = Group.create(name: 'Managers, officials, and propr\'s exec. farm', group_header: occupation)
clerical = Group.create(name: 'Clerical', group_header: occupation)
sales = Group.create(name: 'Sales', group_header: occupation)
craftsmen = Group.create(name: 'Craftsmen and foremen', group_header: occupation)
operatives = Group.create(name: 'Operatives', group_header: occupation)
private_household = Group.create(name: 'Private household workers', group_header: occupation)
service = Group.create(name: 'Service workers, except private household', group_header: occupation)
farm_laborers = Group.create(name: 'Farm laborers and farm foremen', group_header: occupation)
laborers_other = Group.create(name: 'Laborers, except farm and mine', group_header: occupation)
occupation_not_reported = Group.create(name: 'Occupation not reported', group_header: occupation)


# Percentages
# Population total
berkeley_pop_perc = Group.create(name: 'Berkeley Population (%)', group_header: demographics)

# Race
race_white_perc = Group.create(name: 'White (%)', group_header: demographics)
race_african_american_perc = Group.create(name: 'African American (%)', group_header: demographics)
race_indian_perc = Group.create(name: 'Indian (%)', group_header: demographics)
race_japanese_perc = Group.create(name: 'Japanese (%)', group_header: demographics)
race_chinese_perc = Group.create(name: 'Chinese (%)', group_header: demographics)

# White person with Spanish surname
white_spanish_surname_perc = Group.create(name: 'White, Spanish Surname (%)', group_header: demographics)

# Sex
male_perc = Group.create(name: 'Male (%)', group_header: demographics)
female_perc = Group.create(name: 'Female (%)', group_header: demographics)

# Age
age_under_5_perc = Group.create(name: 'Under 5 years (%)', group_header: demographics)
age_5_to_17_perc = Group.create(name: '5 to 17 years (%)', group_header: demographics)
age_18_to_64_perc = Group.create(name: '18 to 64 years (%)', group_header: demographics)
age_65_over_perc = Group.create(name: '65 years and over (%)', group_header: demographics)

# Housing occupancy
housing_total_perc = Group.create(name: 'All housing units (%)', group_header: housing)
occupied_housing_perc = Group.create(name: 'Occupied housing units (%)', group_header: housing)
owner_occupied_perc = Group.create(name: 'Owner occupied housing units (%)', group_header: housing)
renter_occupied_perc = Group.create(name: 'Renter occupied housing units (%)', group_header: housing)
vacant_perc = Group.create(name: 'Vacant housing units (%)', group_header: housing)

# Schooling
pop_over_25_perc = Group.create(name: 'Population 25 years and over (%)', group_header: schooling)
high_school_perc = Group.create(name: 'Completed high school (4 years) (%)', group_header: schooling)
college_perc = Group.create(name: 'Completed college (4+ years) (%)', group_header: schooling)

# Occupation
employed_perc = Group.create(name: 'Employed (%)', group_header: occupation)
professional_perc = Group.create(name: 'Professional and technical (%)', group_header: occupation)
farmers_perc = Group.create(name: 'Farmers and farm managers (%)', group_header: occupation)
managers_perc = Group.create(name: 'Managers, officials, and propr\'s exec. farm (%)', group_header: occupation)
clerical_perc = Group.create(name: 'Clerical (%)', group_header: occupation)
sales_perc = Group.create(name: 'Sales (%)', group_header: occupation)
craftsmen_perc = Group.create(name: 'Craftsmen and foremen (%)', group_header: occupation)
operatives_perc = Group.create(name: 'Operatives (%)', group_header: occupation)
private_household_perc = Group.create(name: 'Private household workers (%)', group_header: occupation)
service_perc = Group.create(name: 'Service workers, except private household (%)', group_header: occupation)
farm_laborers_perc = Group.create(name: 'Farm laborers and farm foremen (%)', group_header: occupation)
laborers_other_perc = Group.create(name: 'Laborers, except farm and mine (%)', group_header: occupation)
occupation_not_reported_perc = Group.create(name: 'Occupation not reported (%)', group_header: occupation)


# People
Person.create(name: 'Mario Savio', slug: 'mario-savio', important: true)
Person.create(name: 'Michael Rossman', slug: 'michael-rossman', important: true)
Person.create(name: 'John Doe', slug: 'john-doe', important: false)

# 1950 - 1960 census data (values)
Node.create(date: Date.new(1960, 1, 1), value: 113805, group: berkeley_pop)
Node.create(date: Date.new(1960, 1, 1), value: 96268, group: race_white)
Node.create(date: Date.new(1960, 1, 1), value: 13289, group: race_african_american)
Node.create(date: Date.new(1960, 1, 1), value: 35, group: race_indian)
Node.create(date: Date.new(1960, 1, 1), value: 2147, group: race_japanese)
Node.create(date: Date.new(1960, 1, 1), value: 1689, group: race_chinese)
Node.create(date: Date.new(1960, 1, 1), value: 2592, group: white_spanish_surname)

Node.create(date: Date.new(1960, 1, 1), value: 55146, group: male)
Node.create(date: Date.new(1960, 1, 1), value: 58659, group: female)
Node.create(date: Date.new(1960, 1, 1), value: 9136, group: age_under_5)
Node.create(date: Date.new(1960, 1, 1), value: 14149, group: age_5_to_17)
Node.create(date: Date.new(1960, 1, 1), value: 79665, group: age_18_to_64)
Node.create(date: Date.new(1960, 1, 1), value: 10855, group: age_65_over)
Node.create(date: Date.new(1960, 1, 1), value: 31.4, group: age_median)

Node.create(date: Date.new(1960, 1, 1), value: 2.81, group: household)
Node.create(date: Date.new(1960, 1, 1), value: 37460, group: housing_total)
Node.create(date: Date.new(1960, 1, 1), value: 36527, group: occupied_housing)
Node.create(date: Date.new(1960, 1, 1), value: 17400, group: owner_occupied)
Node.create(date: Date.new(1960, 1, 1), value: 19127, group: renter_occupied)
Node.create(date: Date.new(1960, 1, 1), value: 933, group: vacant)

Node.create(date: Date.new(1960, 1, 1), value: 4084, group: income)

Node.create(date: Date.new(1960, 1, 1), value: 71560, group: pop_over_25)
Node.create(date: Date.new(1960, 1, 1), value: 17895, group: high_school)
Node.create(date: Date.new(1960, 1, 1), value: 17725, group: college)

Node.create(date: Date.new(1960, 1, 1), value: 47145, group: employed)
Node.create(date: Date.new(1960, 1, 1), value: 11231, group: professional)
Node.create(date: Date.new(1960, 1, 1), value: 62, group: farmers)
Node.create(date: Date.new(1960, 1, 1), value: 5178, group: managers)
Node.create(date: Date.new(1960, 1, 1), value: 9012, group: clerical)
Node.create(date: Date.new(1960, 1, 1), value: 4060, group: sales)
Node.create(date: Date.new(1960, 1, 1), value: 4564, group: craftsmen)
Node.create(date: Date.new(1960, 1, 1), value: 4276, group: operatives)
Node.create(date: Date.new(1960, 1, 1), value: 1612, group: private_household)
Node.create(date: Date.new(1960, 1, 1), value: 4491, group: service)
Node.create(date: Date.new(1960, 1, 1), value: 69, group: farm_laborers)
Node.create(date: Date.new(1960, 1, 1), value: 2246, group: laborers_other)
Node.create(date: Date.new(1960, 1, 1), value: 344, group: occupation_not_reported)

# 1950 - 1960 census data (percentages)
Node.create(date: Date.new(1960, 1, 1), value: 100, group: berkeley_pop_perc)
Node.create(date: Date.new(1960, 1, 1), value: 84.6, group: race_white_perc)
Node.create(date: Date.new(1960, 1, 1), value: 11.7, group: race_african_american_perc)
Node.create(date: Date.new(1960, 1, 1), value: 0, group: race_indian_perc)
Node.create(date: Date.new(1960, 1, 1), value: 1.9, group: race_japanese_perc)
Node.create(date: Date.new(1960, 1, 1), value: 1.5, group: race_chinese_perc)
Node.create(date: Date.new(1960, 1, 1), value: 2.3, group: white_spanish_surname_perc)

Node.create(date: Date.new(1960, 1, 1), value: 48.5, group: male_perc)
Node.create(date: Date.new(1960, 1, 1), value: 51.5, group: female_perc)
Node.create(date: Date.new(1960, 1, 1), value: 8, group: age_under_5_perc)
Node.create(date: Date.new(1960, 1, 1), value: 12.4, group: age_5_to_17_perc)
Node.create(date: Date.new(1960, 1, 1), value: 70, group: age_18_to_64_perc)
Node.create(date: Date.new(1960, 1, 1), value: 9.5, group: age_65_over_perc)

Node.create(date: Date.new(1960, 1, 1), value: 100, group: housing_total_perc)
Node.create(date: Date.new(1960, 1, 1), value: 97.5, group: occupied_housing_perc)
Node.create(date: Date.new(1960, 1, 1), value: 47.6, group: owner_occupied_perc)
Node.create(date: Date.new(1960, 1, 1), value: 52.4, group: renter_occupied_perc)
Node.create(date: Date.new(1960, 1, 1), value: 2.5, group: vacant_perc)

Node.create(date: Date.new(1960, 1, 1), value: 100, group: pop_over_25_perc)
Node.create(date: Date.new(1960, 1, 1), value: 25, group: high_school_perc)
Node.create(date: Date.new(1960, 1, 1), value: 24.8, group: college_perc)

Node.create(date: Date.new(1960, 1, 1), value: 100, group: employed_perc)
Node.create(date: Date.new(1960, 1, 1), value: 23.8, group: professional_perc)
Node.create(date: Date.new(1960, 1, 1), value: 0.1, group: farmers_perc)
Node.create(date: Date.new(1960, 1, 1), value: 11, group: managers_perc)
Node.create(date: Date.new(1960, 1, 1), value: 19.1, group: clerical_perc)
Node.create(date: Date.new(1960, 1, 1), value: 8.6, group: sales_perc)
Node.create(date: Date.new(1960, 1, 1), value: 9.7, group: craftsmen_perc)
Node.create(date: Date.new(1960, 1, 1), value: 9.1, group: operatives_perc)
Node.create(date: Date.new(1960, 1, 1), value: 3.4, group: private_household_perc)
Node.create(date: Date.new(1960, 1, 1), value: 9.5, group: service_perc)
Node.create(date: Date.new(1960, 1, 1), value: 0.1, group: farm_laborers_perc)
Node.create(date: Date.new(1960, 1, 1), value: 4.8, group: laborers_other_perc)
Node.create(date: Date.new(1960, 1, 1), value: 0.7, group: occupation_not_reported)

# 1960 - 1970 census data (values)
Node.create(date: Date.new(1970, 1, 1), value: 111268, group: berkeley_pop)
Node.create(date: Date.new(1970, 1, 1), value: 82081, group: race_white)
Node.create(date: Date.new(1970, 1, 1), value: 21850, group: race_african_american)
Node.create(date: Date.new(1970, 1, 1), value: 71, group: race_indian)
Node.create(date: Date.new(1970, 1, 1), value: 3665, group: race_japanese)
Node.create(date: Date.new(1970, 1, 1), value: 2678, group: race_chinese)
Node.create(date: Date.new(1970, 1, 1), value: 3759, group: white_spanish_surname)

Node.create(date: Date.new(1970, 1, 1), value: 53094, group: male)
Node.create(date: Date.new(1970, 1, 1), value: 58174, group: female)
Node.create(date: Date.new(1970, 1, 1), value: 9087, group: age_under_5)
Node.create(date: Date.new(1970, 1, 1), value: 18626, group: age_5_to_17)
Node.create(date: Date.new(1970, 1, 1), value: 70067, group: age_18_to_64)
Node.create(date: Date.new(1970, 1, 1), value: 13488, group: age_65_over)
Node.create(date: Date.new(1970, 1, 1), value: 30.2, group: age_median)

Node.create(date: Date.new(1970, 1, 1), value: 2.57, group: household)
Node.create(date: Date.new(1970, 1, 1), value: 41588, group: housing_total)
Node.create(date: Date.new(1970, 1, 1), value: 39686, group: occupied_housing)
Node.create(date: Date.new(1970, 1, 1), value: 17477, group: owner_occupied)
Node.create(date: Date.new(1970, 1, 1), value: 22209, group: renter_occupied)
Node.create(date: Date.new(1970, 1, 1), value: 1882, group: vacant)

Node.create(date: Date.new(1970, 1, 1), value: 6576, group: income)

Node.create(date: Date.new(1970, 1, 1), value: 64674, group: pop_over_25)
Node.create(date: Date.new(1970, 1, 1), value: 13222, group: high_school)
Node.create(date: Date.new(1970, 1, 1), value: 19693, group: college)

Node.create(date: Date.new(1970, 1, 1), value: 47013, group: employed)
Node.create(date: Date.new(1970, 1, 1), value: 13168, group: professional)
Node.create(date: Date.new(1970, 1, 1), value: 190, group: farmers)
Node.create(date: Date.new(1970, 1, 1), value: 3464, group: managers)
Node.create(date: Date.new(1970, 1, 1), value: 9208, group: clerical)
Node.create(date: Date.new(1970, 1, 1), value: 2995, group: sales)
Node.create(date: Date.new(1970, 1, 1), value: 3460, group: craftsmen)
Node.create(date: Date.new(1970, 1, 1), value: 3710, group: operatives)
Node.create(date: Date.new(1970, 1, 1), value: 1604, group: private_household)
Node.create(date: Date.new(1970, 1, 1), value: 4121, group: service)
Node.create(date: Date.new(1970, 1, 1), value: 14, group: farm_laborers)
Node.create(date: Date.new(1970, 1, 1), value: 1785, group: laborers_other)
Node.create(date: Date.new(1970, 1, 1), value: 3165, group: occupation_not_reported)

# 1960 - 1970 census data (percentages)
Node.create(date: Date.new(1970, 1, 1), value: 100, group: berkeley_pop_perc)
Node.create(date: Date.new(1970, 1, 1), value: 73.8, group: race_white_perc)
Node.create(date: Date.new(1970, 1, 1), value: 19.6, group: race_african_american_perc)
Node.create(date: Date.new(1970, 1, 1), value: 0.1, group: race_indian_perc)
Node.create(date: Date.new(1970, 1, 1), value: 3.3, group: race_japanese_perc)
Node.create(date: Date.new(1970, 1, 1), value: 2.4, group: race_chinese_perc)
Node.create(date: Date.new(1970, 1, 1), value: 3.4, group: white_spanish_surname_perc)

Node.create(date: Date.new(1970, 1, 1), value: 47.7, group: male_perc)
Node.create(date: Date.new(1970, 1, 1), value: 52.3, group: female_perc)
Node.create(date: Date.new(1970, 1, 1), value: 8.2, group: age_under_5_perc)
Node.create(date: Date.new(1970, 1, 1), value: 16.7, group: age_5_to_17_perc)
Node.create(date: Date.new(1970, 1, 1), value: 63, group: age_18_to_64_perc)
Node.create(date: Date.new(1970, 1, 1), value: 12.1, group: age_65_over_perc)

Node.create(date: Date.new(1970, 1, 1), value: 100, group: housing_total_perc)
Node.create(date: Date.new(1970, 1, 1), value: 95.5, group: occupied_housing_perc)
Node.create(date: Date.new(1970, 1, 1), value: 44, group: owner_occupied_perc)
Node.create(date: Date.new(1970, 1, 1), value: 56, group: renter_occupied_perc)
Node.create(date: Date.new(1970, 1, 1), value: 4.5, group: vacant_perc)

Node.create(date: Date.new(1970, 1, 1), value: 100, group: pop_over_25_perc)
Node.create(date: Date.new(1970, 1, 1), value: 20.4, group: high_school_perc)
Node.create(date: Date.new(1970, 1, 1), value: 30.4, group: college_perc)

Node.create(date: Date.new(1970, 1, 1), value: 100, group: employed_perc)
Node.create(date: Date.new(1970, 1, 1), value: 28, group: professional_perc)
Node.create(date: Date.new(1970, 1, 1), value: 0.4, group: farmers_perc)
Node.create(date: Date.new(1970, 1, 1), value: 7.4, group: managers_perc)
Node.create(date: Date.new(1970, 1, 1), value: 19.6, group: clerical_perc)
Node.create(date: Date.new(1970, 1, 1), value: 6.4, group: sales_perc)
Node.create(date: Date.new(1970, 1, 1), value: 7.4, group: craftsmen_perc)
Node.create(date: Date.new(1970, 1, 1), value: 7.9, group: operatives_perc)
Node.create(date: Date.new(1970, 1, 1), value: 3.4, group: private_household_perc)
Node.create(date: Date.new(1970, 1, 1), value: 8.8, group: service_perc)
Node.create(date: Date.new(1970, 1, 1), value: 0.3, group: farm_laborers_perc)
Node.create(date: Date.new(1970, 1, 1), value: 3.8, group: laborers_other_perc)
Node.create(date: Date.new(1970, 1, 1), value: 6.7, group: occupation_not_reported)
