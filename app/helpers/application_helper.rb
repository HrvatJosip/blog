require 'rouge'
require 'rouge/plugins/redcarpet'
module ApplicationHelper
  class HTMLwithRouge < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    def rouge_formatter(opts={})
      opts ={
        wrap: true,
      }
      Rouge::Formatters::HTML.new(opts)
    end
  end

  def markdown(content)
    renderer = HTMLwithRouge.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethorugh: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
