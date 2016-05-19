require 'csv'
require 'yaml'
require 'redcarpet'

namespace :wsc do
  desc "convert a csv file to a temp yaml file"
  task :speaker_import, [:csv_filename] do |t, args|
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
