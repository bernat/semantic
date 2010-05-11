begin
  require ::File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

get '/semantic.css' do
  erb :css, :layout => false
end


__END__

@@ layout
%html
  %head
    %title Sem&agrave;ntic
    %link(href="semantic.css" rel="stylesheet" type="text/css")
  %body
    = yield

@@ index
%h1
  sem&agrave;ntic
  %em> podcast
%h2 properament

@@ css
body { font-family: Arial; text-align: center; margin: 100px 0 0 0;}
h1
{
  display: inline;
  font-size: 70px;
}

h1
{
  color: #980000;
}

h1 em
{
  color: #333333;
  font-style: normal;
}
