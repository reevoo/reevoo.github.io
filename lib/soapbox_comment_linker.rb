require 'pry'
require 'httparty'

module SoapboxCommentLinker
  def link
    get_all_post_files.each do |file|
      link_soapbox_comments(file)
    end
  end

  private

  def get_all_post_files
    Dir["_posts/*.markdown"]
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
    response = ::HTTParty.post('http://127.0.0.1:9292/v1/content',
                  body: {
                          tags: ['development'],
                          url: 'http://reevoo.github.io'
                        }.to_json,
                  headers: {
                    'Content-Provider' => 'Reevoo Devs Blog',
                    'Provider-Secret' => 'a7a10c03f642febc28dc774aff8b1378361ab3e44fc0d1d3310535b14a50f7aa',
                    'Content-Type' => 'application/json',
                  }
    )

    # HTTParty.post('https://widgets.reevoo.com/v1/content',
    #               body: { tags: [] }
    # )
    return response['id'] if response.code == 201
  end

  extend self
end
