# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.create(name: 'George of the Jungle', party: 'Know-Nothing')
Candidate.create(name: 'George Washington', party: 'False-Teeth')
Candidate.create(name: 'George Hamilton', party: 'Super-Tan')
Candidate.create(name: 'George Jones', party: 'Country-Western')

Voter.create(name: 'John Q. Public', party: 'Democrat')
Voter.create(name: 'Jon Bon Jovi', party: 'Republican')
Voter.create(name: 'Jon Stewart', party: 'Democrat')
Voter.create(name: 'Joan Rivers', party: 'Independent')

Vote.create(voter: 'John Q. Public', candidate: 'George of the Jungle')
Vote.create(voter: 'Jon Bon Jovi', candidate: 'George Washington')
Vote.create(voter: 'Jon Stewart', candidate: 'George Hamilton')
Vote.create(voter: 'Joan Rivers', candidate: 'George Jones')