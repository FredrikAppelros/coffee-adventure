# Literate CoffeeScript plugin for Jekyll
#
# This plugin adds both a converter for `.litcoffee` files, as well as
# a filter, `litcoffeeify`, for converting literate CoffeeScript files
# into HTML.
#
# Basically, this is all just a thin wrapper around the existing
# `Markdown` converter with the `RedcarpetParser`, only with the
# default language for code blocks set to `'coffee'` instead of
# `'text'`.

module Jekyll
  module Converters
    class LiterateCoffeeScript < Markdown
      class LiterateCoffeeScriptParser < RedcarpetParser
        module HighlightLiterateCoffeeScript
          include Markdown::RedcarpetParser::WithPygments
          alias orig_block_code block_code
          def block_code(code, lang)
            orig_block_code(code, lang || 'coffee')
          end
        end
        def initialize(config)
          super
          @renderer = Class.new(Redcarpet::Render::HTML) do
            include HighlightLiterateCoffeeScript
          end
        end
      end
      def initialize(config)
        super(config)
        @parser = LiterateCoffeeScriptParser.new(@config)
      end
      def matches(ext)
        ext =~ /^\.litcoffee$/i
      end
      def convert(content)
        @parser.convert(content)
      end
    end
  end
  module LiterateCoffeeScriptFilter
    def litcoffeeify(input)
      site = @context.registers[:site]
      converter = if site.respond_to?(:find_converter_instance)
        site.find_converter_instance(Jekyll::Converters::LiterateCoffeeScript)
      else
        site.getConverterImpl(Jekyll::Converters::LiterateCoffeeScript)
      end
      converter.convert(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::LiterateCoffeeScriptFilter)
