require 'httparty'
require 'yaml'

module SoapboxCommentLinker

  def link
    get_all_post_files.each do |file|
      link_soapbox_comments(file)
    end
  end

  private

  def get_all_post_files
    Dir["_posts/*.{md,markdown}"]
  end

  def link_soapbox_comments(file)
    has_content_id_variable = false
    read_file = File.readlines(file).each do |line|
      if line.include?('soapboxContentId:')
        has_content_id_variable = true
        break
      end
    end

    unless has_content_id_variable
      jekyll_variable = "soapboxContentId: #{request_new_content_id}\n"
      index = read_file.index("---\n")

      read_file.insert(index+1, jekyll_variable)
      File.write(file, read_file.join(''))

      p "Linked file to soapbox: #{file}"
    end
  end

  def request_new_content_id
    response = ::HTTParty.post(config['content_url'],
                  body: {
                          tags: ['development'],
                          url: 'http://reevoo.github.io'
                        }.to_json,
                  headers: {
                    'Content-Provider' => 'reevoo.github.io',
                    'Provider-Secret' => config['provider_key'],
                    'Content-Type' => 'application/json',
                  }
    )

    return response['id'] if response.code == 201
  end

  def config
    YAML.load_file('soapbox_config.yml')
  end

  extend self
end
