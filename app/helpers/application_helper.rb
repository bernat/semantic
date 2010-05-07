module ApplicationHelper

  def gravatar(email, options={})
        src = h(gravatar_url(email, options))
        [:class, :alt, :size].each { |opt| options[opt] = h(options[opt]) }
        "<img class=\"#{options[:class]}\" alt=\"#{options[:alt]}\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{src}\" style=\"padding-bottom:3px\" />"      
  end

  def gravatar_api_url(hash)
          "http://www.gravatar.com/avatar/#{hash}"
  end

  def gravatar_url(email, options={})
       email_hash = Digest::MD5.hexdigest(email)
       options[:default] = CGI::escape(options[:default]) unless options[:default].nil?
       returning gravatar_api_url(email_hash) do |url|
         opts = []
         [:rating, :size, :default].each do |opt|
           unless options[opt].nil?
             value = h(options[opt])
             opts << [opt, value].join('=')
           end
         end
         url << "?#{opts.join('&')}" unless opts.empty?
       end
    end
  
end
