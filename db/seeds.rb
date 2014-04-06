# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group_headers = GroupHeader.create([{ name: 'Events' },
                                    { name: 'Demographics' }])

Group.create(name: 'Protests', group_header: group_headers.first)
Group.create(name: 'Arrests', group_header: group_headers.first)

Group.create(name: 'Gender', group_header: group_headers.last)
