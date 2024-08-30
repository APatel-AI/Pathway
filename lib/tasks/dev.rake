unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data",
    ]

    desc "Adds sample data for development environment"
    task sample_data: [
      :environment,
      "dev:add_user",
      "dev:add_profile",
    ] do
      puts "done adding sample data"
    end

    task add_user: :environment do
      puts "adding user..."
      @user = User.create(
        email: "hiro@example.com",
        password: "password",
      )
    
      if @user.persisted?
        puts "added #{@user.email} with id #{@user.id}"
      else
        puts "User not saved. Errors: #{@user.errors.full_messages.join(", ")}"
      end
    
      puts "done"
    end
    

    task add_profile: :environment do
      puts "creating profile..."

      dependent = Dependent.create(
        address: "200 South Wacker dr",
        relationship: "Sibling",
        first_name: "Enzo",
        last_name: "Hamada",
        date_of_birth: Date.new(2001, 2, 6),
        immigration_status: "Work Visa",
        country_of_citizenship: "Kenya",
        contact_info: "Enzo@gmail.com",
        notes: "Update USCIS profile information by 08/20/2025",
        user: @user
      )
      puts "created dependent profile for #{@user.email}"

      puts "done"
    end
  end
end
