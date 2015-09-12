require 'jekyll'

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

        def class_with_proper_highlighter(highlighter)
          case highlighter
          when "pygments"
            Class.new(Redcarpet::Render::HTML) do
              include HighlightLiterateCoffeeScript
            end
          else
            super
          end
        end

      end

      def setup
        return if @setup
        if @config['markdown'].downcase == 'redcarpet'
          @parser = LiterateCoffeeScriptParser.new(@config)
          @setup = true
        else
          @parser = super
        end
      end

      def matches(ext)
        ext =~ /^\.litcoffee$/i
      end

    end
  end
end
