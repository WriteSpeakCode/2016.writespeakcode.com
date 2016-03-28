module ActionView
  class TemplateRenderer
    alias _orig_render_template render_template

    private

    def render_template(template, layout_name = nil, locals = nil)
      layout_name = determine_layout_name(layout_name)
      _orig_render_template(template, layout_name, locals)
    end

    def determine_layout_name(layout_name)
      if layout_name.respond_to?(:call)
        if ApplicationHelper::PageData.try(:data).try(:layout)
          layout_name = "layouts/" + ApplicationHelper::PageData.data.layout
        end
      end

      layout_name
    end
  end

  class Template
    alias _orig_initialize initialize
    alias partial render
    alias _orig_render render

    def initialize(source, identifier, handler, details)
      strip_yaml_frontmatter(source)
      _orig_initialize(source, identifier, handler, details)
    end

    def render(view, locals, buffer=nil, &block)
      view.instance_eval { alias partial render }
      _orig_render(view, locals, buffer, &block)
    end

    private

    def strip_yaml_frontmatter(source)
      yaml_regex = /\A(-{3,}\s*\n.*)^(-{3,}\s*$\n?)/m

      if source =~ yaml_regex
        source.sub!(yaml_regex, "")

        data = YAML.load($1)
        ApplicationHelper::PageData.parse_data(data)
      end
    end
  end
end
