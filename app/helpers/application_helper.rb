module ApplicationHelper
  class Data
    class << self
      attr_reader :stored_data

      def parse_data(data)
        @stored_data = Hashie::Mash.new(data)
      end

      def data
        stored_data
      end

      def method_missing(m, *args, &block)
        if stored_data.keys.include?(m.to_s)
          stored_data[m.to_s]
        else
          super
        end
      end
    end
  end

  class PageData < Data; end

  class DataFolder < Data
    class << self
      def parse_data(*)
        @stored_data = {}

        Dir.chdir(File.expand_path('data', Rails.root)) do
          Dir.foreach(Dir.pwd) do |filename|
            next if File.directory?(filename)
            file_path = File.expand_path(filename, Dir.pwd)
            key, data = parse_file(file_path)
            @stored_data[key] = data
          end
        end
      end

      def parse_file(file_path)
        base_name = File.basename(file_path, File.extname(file_path))
        data = YAML.load_file(file_path)
        if data.is_a? Array
          data.map! do |item|
            Hashie::Mash.new(item)
          end
        else
          data = Hashie::Mash.new(data)
        end
        return base_name, data
      end
    end

    parse_data
  end

  def current_page
    PageData
  end

  def page_classes
  end

  def data
    DataFolder
  end

  def wrap_layout(layout, &block)
    layout = 'layouts/' + layout.to_s
    view_renderer.render_partial(self, {partial: layout, as_nested_layout: true}, &block)
  end

  def included(klass)
    klass.instance_eval do
      alias partial render
    end
  end
end
