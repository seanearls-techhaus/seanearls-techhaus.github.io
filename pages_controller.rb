class PagesController
  def site1(email)
    @email = email
    erb :site1
  end

  def site2(email)
    @email = email
    erb :site2
  end

  def submit_email(email)
    # Perform any additional logic with the email, such as setting a cookie
    response.set_cookie('userEmail', value: email)
    redirect '/site2'
  end

  def clear_cookie
    response.delete_cookie('userEmail')
    redirect '/site1'
  end
end
