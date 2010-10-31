$paperclip_settings = Rails.env.production? ? {
                        :storage => :s3,
                        :s3_credentials => {
                          :access_key_id => ENV["AWS_ID"],
                          :secret_access_key => ENV["AWS_SECRET"]
                        },
                        :bucket => "assets.semantic.cat",
                        :path => "episodes/episode:id.mp3",
                        :s3_host_alias => "assets.semantic.cat",
                        :url => ":s3_alias_url"
                      } : {
                        :path => ":rails_root/public/system/episodes/episode:id.mp3",
                        :url => "/system/episodes/episode:id.mp3"
                      }
