namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_trips
  end
end


def make_users
  avatar = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleProfileImages/admin.jpg')).sample)
  admin = User.create!(firstname: "Tim",
                 lastname: "Geaney",
                 avatar: avatar,
                 email: "admin@example.com",
                 gender: "male",
                 username: "admin",
                 password: "foobar2013",
                 password_confirmation: "foobar2013")

  admin.has_role(:admin)

  20.times do |n|
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      email = "user-#{n+1}@trip.com"
      username  = "@" + (first_name + '_' + last_name).downcase
      avatar = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleProfileImages', '*')).sample)
      User.create!(firstname: first_name,
                   lastname: last_name,
                   avatar: avatar,
                   email: email,
                   gender: ["male", "female"].sample,
                   username: username,
                   password: "foobar2013",
                   password_confirmation: "foobar2013")
    end
  end


  def make_trips
    user = User.all(limit: 10)
      3.times do |n|
        picture = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleDestinationImages', '*')).sample)
        destination = ["Paris", "Rome", "Barcelona", "Dusselldorf", "Bruge", "London"].sample
        description = ["skiing", "snowboarding", "cycling", "art", "culture"].sample
        start_date = rand_start_date
        end_date = start_date + (60 * 60 * 24)*14
        purpose = ["business", "pleasure"].sample

        user.each { |user| user.trips.create!(
          picture: picture,
          destination: destination,
          description: description,
          startdate: start_date,
          enddate: end_date,
          purpose: purpose
          )}
      end
  end

  def rand_start_date
    t = Time.now
    days = (60 * 60 * 24)
    random_nr_days = days*rand(365)
    start_date = t + random_nr_days
  end