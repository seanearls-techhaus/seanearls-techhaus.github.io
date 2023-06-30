class PagesController
  def site1(email)
    @email = email
    erb :site1, :locals => { :email => @email }
  end

  def site2(email)
    @email = email
    erb :site2, :locals => { :email => @email }
  end

  def submit_email(email)
    if email.nil? || email.empty?
        redirect '/site1'
    else
        # Perform any additional logic with the email, such as setting a cookie
        response.set_cookie('userEmail', value: email)
        redirect '/site2'
    end
  end

  def clear_cookie
    response.delete_cookie('userEmail')
    redirect '/site1'
  end
end
