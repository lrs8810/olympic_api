require 'csv'

namespace :import do
  desc "Import 2016 olympic data from csv files"
  task olympics: :environment do
    file = "data/olympic_data_2016.csv"

    CSV.foreach(file, headers: true) do |row|
      sport = Sport.find_or_create_by(name: row['Sport'])
      team = Team.find_or_create_by(name: row['Team'])
      olympian = Olympian.find_or_create_by(sport: sport,
                                            team: team,
                                            full_name: row['Name'],
                                            sex: row['Sex'],
                                            age: row['Age'],
                                            height: row['Height'],
                                            weight: row['Weight']
                                            )
      event = Event.find_or_create_by(name: row['Event'], sport: sport)
      OlympianEvent.create(olympian: olympian, event: event, medal: row['Medal'])
    end
  end
end
