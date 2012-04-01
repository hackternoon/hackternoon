class RegistrationsController < Devise::RegistrationsController
  # I define some actions here so I can put some view here:
  # ../views/registrations/

  def create
    super
  end

  # GET an edit form with some fields filled in.
  def edit
    pu = current_user.photo_urls.where(:profile_photo => true)
    if pu.present?
      @pu = pu.first.the_url
    else
      @pu = ''
    end
    super
  end # def edit

  # PUT data from form into registrations#update.
  def update
    if params[:photo_url].present?
      # If the photo_url is present I want to UPDATE :the_url with a new value.
      # Else I want to INSERT a new photo_url.
      pu = current_user.photo_urls.where(:profile_photo => true).first_or_create(:the_url => params[:photo_url])
      # If the URL has changed, save it:
      if params[:photo_url] != pu.the_url
        pu.the_url = params[:photo_url]
        pu.save
      end
    end
    # Now deal with @user  
    super
  end # def update

  def cancel
    super
  end

  def new
    super
  end

  def destroy
    super
  end

end

