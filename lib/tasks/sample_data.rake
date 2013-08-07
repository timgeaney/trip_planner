namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end


def make_users
  avatar = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleProfileImages', '*')).sample)
  admin = User.create!(firstname: "admin",
                 lastname: "admin",
                 avatar: avatar,
                 email: "admin@example.com",
                 gender: "male",
                 username: "admin",
                 password: "foobar2013",
                 password_confirmation: "foobar2013")

  admin.has_role(:admin)

  30.times do |n|
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      email = "user-#{n+1}@frock.com"
      username  = "@" + (first_name+last_name).downcase
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
