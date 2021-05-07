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
          'f791ec40-d501-4027-b48c-02dc0a8f3cf7',
          '_feXJy4PF2zfYoskSP_E6c92VhonTbXPiCeK#C75a-zz7VPfYOKFb_e9nqWkpiJ_',
          'https://sandbox.belvo.com'
        )
    end
end
