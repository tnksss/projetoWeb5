it "displays the user's error message when user or password is wrong" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'passworda'

    click_button 'Entrar'

    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_selector('div.alert.alert-warning',
                                  text: 'Email ou senha inválida.')
  end