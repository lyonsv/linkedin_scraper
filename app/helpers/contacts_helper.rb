module ContactsHelper
  def company_date_format number
    number.strftime("%d %B, %Y") if number.present?
  end
end
