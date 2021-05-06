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
          'AUXJ7Ojlk#ySlOm0aeksP1BnQbErbY7KOk575*iuzZmQQ8DsOhJfj758pl9yJFyU',
          'https://sandbox.belvo.com'
        )
    end
end
