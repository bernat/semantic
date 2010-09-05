module ApplicationHelper

  def gravatar(email, options={})
      src = h(gravatar_url(email, options))
      [:class, :alt, :size].each { |opt| options[opt] = h(options[opt]) }
      "<img class=\"#{options[:class]}\" alt=\"#{options[:alt]}\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{src}\" />"      
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

    def pretty_date(date)
      return '' if date.nil?
      return 'Pròximament' if date > Date.today
      if date.to_time.utc > 2.day.ago
        "Fa #{time_ago_in_words date}"
      else
        "Emès el #{date.strftime('%d/%m/%Y')}"
      end
    end

    def antispam_question(num)
      case num
      when 1 #270
        "Resultat de sumar 240 més 30"
      when 2 #50
        "Resultat de restar 100 menys 50"
      when 3 #140
        "Resultat de sumar 40 a 100"
      when 4 #380
        "Resultat de sumar 80 a 300"
      when 5 #1000
        "Resultat de sumar 500 + 500"
      end
    end
    
    def print_tag(tag)
          tag.name.gsub("_", " ")
    end

    def markdown(text)
      Markdown.new(text).to_html.html_safe
    end

    # Github Flavoured Markdown from http://github.github.com/github-flavored-markdown/
    def gfm(text)
      # Extract pre blocks
      extractions = {}
      text.gsub!(%r{<pre>.*?</pre>}m) do |match|
        md5 = Digest::MD5.hexdigest(match)
        extractions[md5] = match
        "{gfm-extraction-#{md5}}"
      end

      # prevent foo_bar_baz from ending up with an italic word in the middle
      text.gsub!(/(^(?! {4}|\t)\w+_\w+_\w[\w_]*)/) do |x|
        x.gsub('_', '\_') if x.split('').sort.to_s[0..1] == '__'
      end

      # in very clear cases, let newlines become <br /> tags
      text.gsub!(/^[\w\<][^\n]*\n+/) do |x|
        x =~ /\n{2}/ ? x : (x.strip!; x << "  \n")
      end

      # Insert pre block extractions
      text.gsub!(/\{gfm-extraction-([0-9a-f]{32})\}/) do
        "\n\n" + extractions[$1]
      end

      markdown(sanitize(text)).html_safe
    end
end
