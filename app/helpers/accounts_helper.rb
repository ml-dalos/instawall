module AccountsHelper

  def avatar(account, type: :regular, width: '50px')
    image_url = case type
                when :regular then account.avatar&.url || 'https://api.adorable.io/avatars/200/abott@adorable.png'
                when :thumb then account.avatar.thumb&.url || 'https://api.adorable.io/avatars/50/abott@adorable.png'
                end
    image_tag(image_url, class: 'avatar', width: width)
  end

  def can_edit_profile?(id)
    account_signed_in? && current_account.id == id
  end
end
