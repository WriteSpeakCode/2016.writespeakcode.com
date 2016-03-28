module ActionView
  class Template
    alias _orig_initialize initialize

    def initialize(source, identifier, handler, details)
      parse_yaml_frontmatter(source)
      _orig_initialize(source, identifier, handler, details)
    end

    private

    def parse_yaml_frontmatter(source)
      yaml_regex = /\A(-{3,}\s*\n.*)^(-{3,}\s*$\n?)/m

      if source =~ yaml_regex
        source.sub!(yaml_regex, "")

        data = YAML.load($1)
        ApplicationHelper::PageData.parse_data(data)
      end
    end
  end
end
