module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Belvo Challenge'
    if (page_title.empty?)
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

    def belvo_client
      Belvo::Client.new(
        ENV['BELVO_SECRET_KEY'],
        ENV['BELVO_PASSWORD'],
        'https://sandbox.belvo.com'
      )
    end
end
