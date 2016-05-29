require 'csv'
require 'yaml'
require 'redcarpet'

namespace :wsc do
  desc "import json people files into database"
  task :speaker_json_to_db => :environment do |t, args|
    Speaker.all.each do |speaker|
      puts "=== Importing #{speaker.name} into database"

      person = Person.where(name: speaker.name).first

      unless person.nil?
        puts "#{speaker.name} already exists!\n\n"
        next
      end

      person = Person.new(
        name: speaker.name,
        email: "#{speaker.slug}@example.com",
        bio: speaker.bio,
        twitter: speaker.twitter,
        website: speaker.website,
        linkedin: speaker.linkedin,
        github: speaker.github,
        job_title: speaker.title,
        company: speaker.company,
        image_filename: speaker.image,
        pronouns: speaker.pronoun || 'she/her',
        display: true
      )

      if person.save
        puts "\t#{person.name} saved as ##{person.id}\n\n"
      else
        puts "ERROR saving #{person.name}. SKIPPING.\n#{person.errors.full_messages}\n\n"
      end

    end
  end

  desc "convert a csv file to a temp yaml file"
  task :speaker_csv_import, [:csv_filename] do |t, args|
    puts  "=== Opening and parsing file: #{args[:csv_filename]}"
    speaker_data = CSV.read(args[:csv_filename], :headers => true).map(&:to_hash)

    speaker_dir = Rails.root.join("app", "models", "speakers")
    puts "=== Creating speakers directory: #{speaker_dir}"
    FileUtils.mkdir_p(speaker_dir) unless File.directory?(speaker_dir)

    puts "=== Initializing markdown parser"
    renderer = Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})

    puts "=== Creating files for each speaker"
    speaker_data.each do |speaker|
      speaker.symbolize_keys!.with_indifferent_access
      speaker.delete(:email)

      speaker[:id] = speaker[:slug].hash;
      speaker[:keynote] = (speaker[:keynote].try(:upcase) == "TRUE")
      speaker[:bio] = markdown.render(speaker[:bio]) unless speaker[:bio].nil?

      begin
        speaker[:talks].gsub!("'","\"")
        speaker[:talks] = JSON.parse(speaker[:talks])
      rescue
      end

      ext = "yml"
      speaker_filename = "#{speaker[:slug]}.#{ext}"
      puts "=== === #{speaker_filename}"

      File.open("#{speaker_dir}/#{speaker_filename}", "w") do |speaker_file|
        speaker_file.write([speaker].to_yaml)
      end
    end
  end
end
