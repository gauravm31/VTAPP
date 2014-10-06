require_relative '../lib/html'

html_page = Html.new
html_page.form(:class => "abc", :name => "praveen") do
  para "abcd"
  text_field :mytext
end